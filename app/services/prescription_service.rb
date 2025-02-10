# frozen_string_literal: true

# PrescriptionService
class PrescriptionService
  # Create a prescription
  # @param [Hash] params
  # @return [Prescription]
  #
  # @example
  #  {
  #  amount: 100,
  #  prescription_dosages: [{dosage_id: 1, duration: 10}]
  #  }
  def create_prescription(params)
    validate_amount(params[:amount])
    prescriptions = params[:prescription_dosages]
    validate_prescriptions(prescriptions)

    total_amount = calculate_total_amount(prescriptions)
    validate_total_amount(total_amount, params[:amount])

    prescription = nil
    ActiveRecord::Base.transaction do
      prescription = Prescription.create!(amount: params[:amount])
      create_prescription_dosages(prescription.id, prescriptions)
    end
    prescription
  end

  private

  def validate_amount(amount)
    raise "Amount cannot be more than $100" if amount > 100
  end

  def validate_prescriptions(prescriptions)
    raise "Prescription dosages cannot be empty" if prescriptions.blank?
  end

  def calculate_total_amount(prescriptions)
    prescriptions.sum do |prescription|
      dosage = Dosage.find(prescription[:dosage_id])
      dosage.medication.unit_price * prescription[:duration] * dosage.frequency_type.multiplier
    end
  end

  def validate_total_amount(total_amount, amount)
    raise "Prescription dosages amount cannot be more than prescription amount" if total_amount > amount
  end

  def create_prescription_dosages(prescription_id, prescriptions)
    prescriptions.each do |record|
      PrescriptionDosage.create!(
        prescription_id: prescription_id,
        dosage_id: record[:dosage_id],
        duration: record[:duration]
      )
    end
  end
end
