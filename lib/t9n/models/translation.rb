module Perfectline
  module T9n
    module Models
      module Translation

        def self.included(base)
          base.__send__(:include, Associations)
          base.__send__(:include, Scopes)
          base.__send__(:include, Validations)
          base.__send__(:include, InstanceMethods)

          base.extend(ClassMethods)
        end

        module Associations

          def self.included(base)
            base.class_eval do
              belongs_to :translatable, :polymorphic => true, :readonly => true
            end
          end

        end

        module Scopes

          def self.included(base)
            base.class_eval do
              named_scope :untranslated, :conditions => "value IS NULL OR value = ''"
              named_scope :translated,   :conditions => "value IS NOT NULL AND value != ''"
              named_scope :orphans,      :conditions => "translatable_id IS NULL"

              named_scope :locale,  lambda{ |locale| {:conditions => {:locale => locale}} }
              named_scope :for,     lambda{ |object| {:conditions => {:translatable_id => object.id, :translatable_type => object.class.name}} }
            end
          end

        end

        module Validations

          def self.included(base)
            base.class_eval do
              validates_presence_of     :locale
              validates_presence_of     :key
              validates_length_of       :key, :maximum => 255
              validates_uniqueness_of   :key, :scope => [:locale, :translatable_id, :translatable_type]
            end
          end

        end

        module ClassMethods

          def available_locales
            find(:all, :select => "DISTINCT locale", :order => :locale).map(&:locale)
          end

          def lookup(key)
            translated.find(:all, :conditions => ["key = ? OR key ILIKE ?", key, "#{key}.%"], :order => :key)
          end

          def cache_key(locale, key, object)
            if object.nil?
              return "#{locale}:#{key}"
            else
              return "#{locale}:#{key}:#{object.class.name}_#{object.id}"
            end
          end

        end

        module InstanceMethods

          def empty?
            value.blank? || value.nil?
          end

        end

      end
    end
  end
end