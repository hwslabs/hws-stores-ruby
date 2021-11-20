class CreateHwsStoreTables < ActiveRecord::Migration
  def self.up
    create_table :hws_stores, id: :uuid do |t|
      t.string   :name
      t.text     :description
      t.jsonb    :tags
      t.timestamps
    end

    create_table :hws_owners, id: :uuid do |t|
      t.string   :name
      t.text     :description
      t.jsonb    :tags
      t.timestamps
    end

    create_table :hws_store_owners do |t|
      t.belongs_to :store, foreign_key: true
      t.belongs_to :owner, foreign_key: true
    end

    add_index :hws_stores, :tags, using: :gin
    add_index :hws_owners, :tags, using: :gin
  end

  def self.down
    drop_table :hws_store_owners
    drop_table :hws_owners
    drop_table :hws_stores
  end
end
