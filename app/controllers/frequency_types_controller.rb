class FrequencyTypesController < ApplicationController
  before_action :set_frequency_type, only: %i[ show update destroy ]

  # GET /frequency_types
  def index
    @frequency_types = FrequencyType.all

    render json: @frequency_types
  end

  # GET /frequency_types/1
  def show
    render json: @frequency_type
  end

  # POST /frequency_types
  def create
    @frequency_type = FrequencyType.new(frequency_type_params)

    if @frequency_type.save
      render json: @frequency_type, status: :created, location: @frequency_type
    else
      render json: @frequency_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /frequency_types/1
  def update
    if @frequency_type.update(frequency_type_params)
      render json: @frequency_type
    else
      render json: @frequency_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frequency_types/1
  def destroy
    @frequency_type.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frequency_type
      @frequency_type = FrequencyType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def frequency_type_params
      params.expect(frequency_type: [ :name, :multiplier, :voided, :voided_date ])
    end
end
