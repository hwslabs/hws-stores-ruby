require 'rails/generators/migration'
require 'rails/generators/active_record'

class HwsStoreGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(path)
    ActiveRecord::Generators::Base.next_migration_number(path)
  end

  def create_model_file
    migration_template 'migration.rb', 'db/migrate/create_hws_store_tables.rb'
  end
end
