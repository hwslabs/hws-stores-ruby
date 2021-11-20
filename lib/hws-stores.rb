# frozen_string_literal: true

module Hws
  module Stores # :nodoc:
    def self.create_store(input)
      allowed_input = input.with_indifferent_access.slice('name', 'description', 'data', 'schema', 'tags')

      if allowed_input.key?('data')
        if allowed_input['data'].is_a?(Numeric)
          allowed_input['value'] == allowed_input.delete('data')
        else
          allowed_input['data'] = allowed_input['data'].with_indifferent_access
        end
      end

      store = Hws::Stores::Models::Store.create(allowed_input)
      store.try(:id)
    end

    def self.update_store(store_id, data)
      data = data.with_indifferent_access
      store = ::Hws::Stores::Models::Store.find(store_id)
      return false if store.nil?

      if data.is_a?(Numeric)
        store.update!(value: data, data: nil)
      else
        store.update!(value: nil, data: data)
      end
    end

    def self.delete_store(store_id)
      store = ::Hws::Stores::Models::Store.find(store_id)
      return false if store.nil?

      store.delete.present?
    end

    module Models # :nodoc:
    end
  end
end

require 'hws-stores/models/store'
require 'hws-stores/models/owner'
