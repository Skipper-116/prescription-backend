class Api::V1::PrescriptionDosagesController < ApplicationController
  before_action :set_prescription_dosage, only: %i[ show update destroy ]

  # GET /prescription_dosages
  def index
    @prescription_dosages = PrescriptionDosage.all

    render json: @prescription_dosages
  end

  # GET /prescription_dosages/1
  def show
    render json: @prescription_dosage
  end

  # POST /prescription_dosages
  def create
    @prescription_dosage = PrescriptionDosage.new(prescription_dosage_params)

    if @prescription_dosage.save
      render json: @prescription_dosage, status: :created, location: @prescription_dosage
    else
      render json: @prescription_dosage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prescription_dosages/1
  def update
    if @prescription_dosage.update(prescription_dosage_params)
      render json: @prescription_dosage
    else
      render json: @prescription_dosage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prescription_dosages/1
  def destroy
    @prescription_dosage.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription_dosage
      @prescription_dosage = PrescriptionDosage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def prescription_dosage_params
      params.expect(prescription_dosage: [ :dosage_id, :duration, :voided, :voded_date ])
    end
end
