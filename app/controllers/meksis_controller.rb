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

  def main_place_types
    render_as_json Services::Meksis.main_place_types
  end

  def sub_place_types
    render_as_json Services::Meksis.sub_place_types
  end

  def classroom_syllabuses
    render_as_json Services::Meksis.syllabuses_by_classroom(
      classroom_syllabuses_params[:classroom_id],
      classroom_syllabuses_params[:year],
      classroom_syllabuses_params[:term]
    )
  end

  def department_syllabuses
    render_as_json Services::Meksis.syllabuses_by_department(
      department_syllabuses_params[:unit_id],
      department_syllabuses_params[:year],
      department_syllabuses_params[:term]
    )
  end

  def unit_syllabuses
    render_as_json Services::Meksis.syllabuses_by_unit(
      unit_syllabuses_params[:unit_id],
      unit_syllabuses_params[:year],
      unit_syllabuses_params[:term]
    )
  end

  private

  def classrooms_params
    params.require(:meksi).permit(:building_id)
  end

  def classroom_syllabuses_params
    params.require(:meksi).permit(:classroom_id, :year, :term)
  end

  def departments_params
    params.require(:meksi).permit(:unit_id)
  end

  def department_syllabuses_params
    params.require(:meksi).permit(:unit_id, :year, :term)
  end

  def unit_syllabuses_params
    params.require(:meksi).permit(:unit_id, :year, :term)
  end
end
