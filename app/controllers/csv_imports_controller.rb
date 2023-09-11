# frozen_string_literal: true

class CsvImportsController < ApplicationController
  before_action :set_csv_import, only: %i[create show update destroy]

  # GET /csv_imports
  def index
    @csv_imports = CsvImport.all

    render json: @csv_imports
  end

  # GET /csv_imports/1
  def show
    render json: @csv_import
  end

  # POST /csv_imports
  def create
    @csv_import = CsvImport.new(csv_import_params)

    if @csv_import.save
      CSV.foreach(@csv_import.path, headers: true) do |row|
        Moves.create!(
          id: row['show_id']
        )
      end

      render json: @csv_import, status: :created, location: @csv_import
    else
      render json: @csv_import.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /csv_imports/1
  def update
    if @csv_import.update(csv_import_params)
      render json: @csv_import
    else
      render json: @csv_import.errors, status: :unprocessable_entity
    end
  end

  # DELETE /csv_imports/1
  def destroy
    @csv_import.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_csv_import
    @csv_import = CsvImport.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def csv_import_params
    params.fetch(:csv_import, {})
  end
end
