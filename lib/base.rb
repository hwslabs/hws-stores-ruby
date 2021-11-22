# frozen_string_literal: true

class Hws::Base < ActiveRecord::Base # :nodoc:
  self.abstract_class = true

  before_create :set_uuid

  def set_uuid
    self.id = Uulsid.generate if self.id.blank?
  end
end
