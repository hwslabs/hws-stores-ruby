# frozen_string_literal: true

require 'hws-stores/models/base'

class Hws::Stores::Models::Owner < Hws::Stores::Models::Base
  has_and_belongs_to_many :stores
end
