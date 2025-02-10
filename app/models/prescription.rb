# frozen_string_literal: true

# Prescription model
class Prescription < ApplicationRecord
  has_many :prescription_dosages

  validates :amount, presence: true

  def as_json(options = {})
    super(options.merge(
      only: [ :id, :amount ],
      methods: [ :prescription_dosages ]
    ))
  end
end
