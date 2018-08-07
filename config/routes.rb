Rails.application.routes.draw do
  namespace :yoksis do
    resources :references do
      collection do
        get :administrative_function
        get :administrative_units
        get :country
        get :district
        get :entrance_type
        get :gender
        get :kod_bid
        get :martyrs_relatives
        get :nationality
        get :province
        get :staff_title
        get :student_disability_type
        get :student_dropout_type
        get :student_education_level
        get :student_entrance_point_type
        get :student_entrance_type
        get :student_grade
        get :student_grading_system
        get :student_punishment_type
        get :studentship_right
        get :studentship_status
        get :unit_instruction_language
        get :unit_instruction_type
        get :unit_status
        get :unit_type
        get :university_type
      end
    end

    resources :meb, controller: :meb do
      collection do
        get :graduation_data
        get :detailed_graduation_data
      end
    end
  end
end
