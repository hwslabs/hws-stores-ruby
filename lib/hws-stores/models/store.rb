# frozen_string_literal: true

require 'hws-stores/models/base'
require 'json_schemer'

class Hws::Stores::Models::Store < Hws::Stores::Models::Base # :nodoc:
  has_and_belongs_to_many :owners

  validate :validate_against_pattern

  private

  def validate_against_pattern
    if self.schema.blank?
      errors.add(:schema, 'schema of the store is not specified')
      return
    end

    schemer = JSONSchemer.schema(self.schema)

    return if self.data.blank? && self.value.blank?

    if self.data.present? && self.value.present?
      errors.add(:data, 'data and value cannot be stored together')
      return
    end

    if self.data.blank? && !schemer.valid?(self.value)
      errors.add(:value, 'Value does not conform to the schema. For value, schema should be of the form {"type": "integer" / "number"}')
      return
    end
    errors.add(:data, 'Data does not conform to the specified schema') if self.value.nil? && !schemer.valid?(self.data)

  end
end
