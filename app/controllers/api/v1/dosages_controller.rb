class Api::V1::DosagesController < ApplicationController
  before_action :set_dosage, only: %i[ show update destroy ]

  # GET /dosages
  def index
    @dosages = Dosage.all

    render json: @dosages
  end

  # GET /dosages/1
  def show
    render json: @dosage
  end

  # POST /dosages
  def create
    @dosage = Dosage.new(dosage_params)

    if @dosage.save
      render json: @dosage, status: :created, location: @dosage
    else
      render json: @dosage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dosages/1
  def update
    if @dosage.update(dosage_params)
      render json: @dosage
    else
      render json: @dosage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dosages/1
  def destroy
    @dosage.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dosage
      @dosage = Dosage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def dosage_params
      params.expect(dosage: [ :medication_id, :frequency_type_id, :amount, :unit, :default_duration ])
    end
end
