# frozen_string_literal: true

class PrescriptionDosage < ApplicationRecord
  belongs_to :dosage
  belongs_to :prescription

  validates :dosage_id, presence: true
  validates :prescription_id, presence: true
  validates :duration, presence: true

  def as_json(options = {})
    super(options.merge(
      only: [ :id, :dosage_id, :duration, :voided, :updated_at, :prescription_id ],
      methods: [ :medication_name, :dosage_amount, :dosage_unit, :frequency_name ]
    ))
  end

  def medication_name
    dosage.medication.name
  end

  def dosage_amount
    dosage.amount
  end

  def dosage_unit
    dosage.unit
  end

  def frequency_name
    dosage.frequency_type.name
  end
end
