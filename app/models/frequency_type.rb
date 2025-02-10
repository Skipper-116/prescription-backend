# frozen_string_literal: true

# FrequencyType model
class FrequencyType < ApplicationRecord
  has_many :dosages

  validates :name, presence: true
  validates :multiplier, presence: true

  def as_json(options = {})
    super(options.merge(only: [ :id, :name, :multiplier ]))
  end
end
