# frozen_string_literal: true

class MeksisController < ApplicationController
  include ActionsResource

  def administrative_departments
    render_as_json Services::Meksis.administrative_departments
  end

  def administrative_units
    render_as_json Services::Meksis.administrative_units
  end

  def buildings
    render_as_json Services::Meksis.buildings
  end

  def characteristics
    render_as_json Services::Meksis.characteristics
  end

  def classrooms
    render_as_json Services::Meksis.classrooms(classrooms_params[:building_id])
  end

  def departments
    render_as_json Services::Meksis.departments(departments_params[:unit_id])
  end

  def main_functionalities
    render_as_json Services::Meksis.main_functionalities
  end

  def sub_functionalities
    render_as_json Services::Meksis.sub_functionalities
  end

  private

  def classrooms_params
    params.require(:meksi).permit(:building_id)
  end

  def departments_params
    params.require(:meksi).permit(:unit_id)
  end
end
