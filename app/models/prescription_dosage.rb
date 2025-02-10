# frozen_string_literal: true

class PrescriptionDosage < ApplicationRecord
  belongs_to :dosage
  belongs_to :prescription

  validates :dosage_id, presence: true
  validates :prescription_id, presence: true
  validates :duration, presence: true

  def as_json(options = {})
    super(options.merge(
      only: [ :id, :dosage_id, :prescription_id ],
      methods: [ :dosage, :prescription ]
    ))
  end
end
