Rails.application.routes.draw do
  namespace :yoksis do
    resources(:graduates) { collection { get :students     } }
    resources(:meb)       { collection { get :students     } }
    resources(:students)  { collection { get :informations } }

    resources :references do
      collection do
        get :administrative_functions
        get :administrative_units
        get :countries
        get :districts
        get :entrance_types
        get :gender
        get :kod_bid
        get :martyrs_relatives
        get :nationalities
        get :cities
        get :staff_titles
        get :student_disability_types
        get :student_dropout_types
        get :student_education_levels
        get :student_entrance_point_types
        get :student_entrance_types
        get :student_grades
        get :student_grading_systems
        get :student_punishment_types
        get :studentship_rights
        get :studentship_statuses
        get :unit_instruction_languages
        get :unit_instruction_types
        get :unit_statuses
        get :unit_types
        get :university_types
      end
    end

    resources :registrations do
      collection do
        get :foundation_tuitions
        get :queries_by_date
        get :queries_by_id_number
      end
    end

    resources :resumes do
      collection do
        get :articles
        get :certifications
        get :projects
      end
    end

    resources :staff do
      collection do
        get :academicians
        get :nationalities
        get :pages
      end
    end

    resources :units do
      collection do
        get :changes
        get :programs
        get :subunits
        get :universities
      end
    end
  end
end
