# frozen_string_literal: true

module Hws
  module Stores # :nodoc:
    def self.create_store(input)
      allowed_input = input.with_indifferent_access.slice('name', 'description', 'data', 'schema', 'tags')

      if allowed_input.key?('data')
        if allowed_input['data'].is_a?(Numeric)
          allowed_input['value'] = allowed_input.delete('data')
        else
          allowed_input['data'] = allowed_input['data'].with_indifferent_access
        end
      end

      store = Hws::Stores::Models::Store.create(allowed_input)
      store.try(:id)
    end

    def self.update_store(store_id:, data: nil, tags: nil)
      store = ::Hws::Stores::Models::Store.find(store_id)
      return false if store.nil?

      update_hash = {}

      update_hash[data.is_a?(Numeric) ? 'value' : 'data'] = data if data.present?
      update_hash['tags'] = store.tags.merge(tags) if tags.present?

      store.update!(update_hash)
    end

    def self.get_store(store_id)
      store = ::Hws::Stores::Models::Store.find(store_id)
      { id: store.id, name: store.name, description: store.description,
        data: store.value || store.data, tags: store.tags }.with_indifferent_access
    end

    def self.increment(store_id, value)
      store = ::Hws::Stores::Models::Store.find(store_id)
      return false if store.nil?

      if store.data.present?
        raise 'Operation allowed only on a value store.'
      end

      store.increment!(:value, value)
    end

    def self.delete_store(store_id)
      store = ::Hws::Stores::Models::Store.find(store_id)
      return false if store.nil?

      store.delete.present?
    end

    def create_owner(name:, description: nil, tags: {})
      owner = ::Hws::Stores::Models::Owner.create(name: name, description: description, tags: tags)
      owner.try(:id)
    end

    def update_owner(owner_id:, name: nil, description: nil, tags: {})
      owner = ::Hws::Stores::Models::Owner.find_by(owner_id)
      return false if owner.nil?

      update_fields = {}
      update_fields['name'] = name if name.present?
      update_fields['description'] = description if description.present?
      update_fields['tags'] = owner.tags.merge(tags) if tags.present?

      owner.update!(update_fields)
    end

    def get_owner(owner_id)
      ::Hws::Stores::Models::Owner.find_by(owner_id).as_json
    end

    def delete_owner(owner_id)
      ::Hws::Stores::Models::Owner.find_by(owner_id).try(:delete)
    end

    module Models # :nodoc:
    end
  end
end

require 'hws-stores/models/store'
require 'hws-stores/models/owner'
