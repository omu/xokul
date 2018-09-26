Rails.application.routes.draw do
  root to: 'home#index'

  namespace :kps, defaults: { format: :json } do
    resources(:verifications) { collection { get :identities } }
    resources(:queries) do
      collection do
        get :addresses
        get :identities
      end
    end
  end

  namespace :osym, defaults: { format: :json } do
    resources(:examination) do
      collection do
        get :groups
        get :result_informations
      end
    end
  end

  namespace :yoksis, defaults: { format: :json } do
    resources(:graduates) { collection { get :informations } }
    resources(:meb)       { collection { get :students     } }
    resources(:military)  { collection { get :informations } }
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
        get :academic_duties
        get :administrative_duties
        get :articles
        get :certifications
        get :citations
        get :editorships
        get :lectures
        get :memberships
        get :other_experiences
        get :papers
        get :projects
        get :refereeing
        get :thesis_advisors
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
        get :units
        get :universities
      end
    end
  end

  get '*path', to: 'application#not_found'
end
