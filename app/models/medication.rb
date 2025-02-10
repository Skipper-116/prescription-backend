# frozen_string_literal: true

# Medication model
class Medication < ApplicationRecord
  has_many :dosages

  validates :name, presence: true
  validates :unit_price, presence: true

  def as_json(options = {})
    super(options.merge(only: [ :id, :name, :unit_price ]))
  end
end
