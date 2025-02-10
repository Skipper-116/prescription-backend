# frozen_string_literal: true

# PrescriptionService Rspec Tests

require 'rails_helper'

RSpec.describe PrescriptionService do
  let(:prescription_service) { PrescriptionService.new }

  describe '#create_prescription' do
    context 'when amount is more than $100' do
      it 'raises an error' do
        params = { amount: 200, prescription_dosages: [ { dosage_id: 1, duration: 10 } ] }
        expect { prescription_service.create_prescription(params) }.to raise_error('Amount cannot be more than $100')
      end
    end

    context 'when prescription dosages are empty' do
      it 'raises an error' do
        params = { amount: 50, prescription_dosages: [] }
        expect { prescription_service.create_prescription(params) }.to raise_error('Prescription dosages cannot be empty')
      end
    end
  end
end
