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
        get :student_drop_out_types
        get :student_education_levels
        get :student_entrance_point_types
        get :student_entrance_types
        get :student_grades
        get :student_grading_systems
        get :student_punishment_types
        get :student_studentship_rights
        get :student_studentship_statuses
        get :unit_instruction_languages
        get :unit_instruction_types
        get :unit_statuses
        get :unit_types
        get :university_types
      end
    end

    resources :resumes do
      collection do
        get :academic_duties
        get :academic_links
        get :administrative_duties
        get :articles
        get :artistic_activities
        get :authors
        get :awards
        get :books
        get :certifications
        get :citations
        get :designs
        get :editorships
        get :education_informations
        get :fields
        get :foreign_languages
        get :incentive_applications
        get :incentive_activity_declarations
        get :lectures
        get :memberships
        get :other_experiences
        get :papers
        get :patents
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
        get :total_pages
      end
    end

    resources :units do
      collection do
        get :changes
        get :programs
        get :subunits
        get :names
        get :universities
      end
    end
  end

  get '*path', to: 'application#not_found'
end
