module Perfectline
  module T9n
    module Models
      module Language

        def self.included(base)
          base.__send__(:include, Scopes)
          base.__send__(:include, Validations)
        end

        module Scopes

          def self.included(base)
            base.class_eval do
              named_scope :code, lambda{ |code| {:conditions => {:code => code.to_s}} }
            end
          end

        end

        module Validations

          def self.included(base)
            base.class_eval do
              validates_presence_of :code
              validates_presence_of :name

              validates_length_of   :code,    :maximum => 5
              validates_length_of   :name,    :maximum => 200
              validates_length_of   :native,  :maximum => 200, :allow_blank => true

              validates_uniqueness_of :code
            end
          end

        end

      end
    end
  end
end