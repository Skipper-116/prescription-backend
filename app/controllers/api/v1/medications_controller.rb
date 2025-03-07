class Api::V1::MedicationsController < ApplicationController
  before_action :set_medication, only: %i[ show update destroy ]

  # GET /medications
  def index
    @medications = Medication.all

    render json: @medications
  end

  # GET /medications/1
  def show
    render json: @medication
  end

  # POST /medications
  def create
    @medication = Medication.new(medication_params)

    if @medication.save
      render json: @medication, status: :created, location: @medication
    else
      render json: @medication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medications/1
  def update
    if @medication.update(medication_params)
      render json: @medication
    else
      render json: @medication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medications/1
  def destroy
    @medication.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication
      @medication = Medication.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def medication_params
      params.expect(medication: [ :name, :voided, :voided_date ])
    end
end
