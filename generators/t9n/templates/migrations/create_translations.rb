class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.references  :translatable,  :polymorphic => true
      t.column      :locale,        :string,  :null => false, :limit => 2
      t.column      :key,           :string,  :null => false, :limit => 255
      t.column      :value,         :text
      t.timestamps
    end

    add_index :translations, [:translatable_id, :translatable_type], :name => "translations_translatable_index"
    add_index :translations, [:locale, :key], :name => "translations_locale_key_index"
    add_index :translations, [:translatable_id, :translatable_type, :locale, :key], :unique => true, 
              :name => "translations_translatable_locale_key_unique_index"
  end

  def self.down
    drop_table :translations
  end
end