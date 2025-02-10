# frozen_string_literal: true

class Api::V1::PrescriptionsController < ApplicationController
  before_action :set_prescription, only: %i[ show update destroy ]

  # GET /prescriptions
  def index
    @prescriptions = Prescription.all

    render json: @prescriptions
  end

  # GET /prescriptions/1
  def show
    render json: @prescription
  end

  # POST /prescriptions
  def create
    params_to_process = prescription_params
    puts "params_to_process: #{params_to_process}"
    @result = service.create_prescription(params_to_process)
    render json: @result, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /prescriptions/1
  def update
    if @prescription.update(prescription_params)
      render json: @prescription
    else
      render json: @prescription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prescriptions/1
  def destroy
    @prescription.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescription_params
      params.permit(:amount, prescription_dosages: [ :dosage_id, :duration ])
    end

    def service
      PrescriptionService.new
    end
end
