# frozen_string_literal: true

require 'csv'

class CsvImportsController < ApplicationController

  def create
    csv_file = params[:csv_file]

    if csv_file
      CSV.foreach(csv_file.path, headers: true) do |row|
        Csv.create!(
          show_id: row['id'],
          title: row['Title'],
          country: row['Country'],
          year: row['Year'],
          description: row['Description']
        )
      end

      render json: { message: 'Dados importados com sucesso!' }
    else
      render json: { error: 'Nenhum arquivo CSV enviado.'}, status: :unprocessable_entity
    end
  end
end
