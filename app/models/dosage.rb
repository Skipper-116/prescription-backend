# frozen_string_literal: true

# Dosage model
class Dosage < ApplicationRecord
  belongs_to :medication
  belongs_to :frequency_type
  has_many :prescription_dosages

  validates :medication, presence: true
  validates :frequency_type, presence: true
  validates :amount, presence: true
  validates :unit, presence: true
  validates :default_duration, presence: true

  def as_json(options = {})
    super(options.merge(
      only: [ :id, :amount, :unit, :default_duration, :medication_id ],
      methods: [ :medication_name, :frequency, :multiplier, :price ]
      ))
  end

  def medication_name
    medication.name
  end

  def price
    medication.unit_price
  end

  def frequency
    frequency_type.name
  end

  def multiplier
    frequency_type.multiplier
  end
end
