# frozen_string_literal: true

class Daimyo < ApplicationRecord
  validates :name, presence: true, length: { maximum: 32 }
end
