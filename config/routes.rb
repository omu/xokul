Rails.application.routes.draw do
  root to: 'home#index'

  namespace :detsis, defaults: { format: :json } do
    get :active_kep_addresses
    get :officiers
    get :parent_establishments_budget_types
    get :parent_establishments_contacts
    get :parent_establishments
    get :place_codes
    get :sdp_codes
    get :sdp_code_references
    get :type_one_codes
    get :type_two_codes
    get :units
  end

  namespace :kps, defaults: { format: :json } do
    resources(:verifications) do
      collection do
        get :id_cards
        get :id_numbers
      end
    end

    resources(:queries) do
      collection do
        get :addresses
        get :identities
      end
    end
  end

  resources :meksis, defaults: { format: :json } do
    collection do
      get :administrative_departments
      get :administrative_units
      get :buildings
      get :characteristics
      get :classrooms
      get :classroom_syllabuses
      get :departments
      get :department_syllabuses
      get :main_place_types
      get :sub_place_types
      get :unit_syllabuses
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
        get :formations
        get :gender
        get :indexes
        get :kod_bid
        get :martyrs_relatives
        get :nationalities
        get :cities
        get :placement_types
        get :staff_appointment_types
        get :staff_duty_types
        get :staff_dropout_types
        get :staff_titles
        get :student_disability_types
        get :student_doykm_types
        get :student_drop_out_types
        get :student_education_levels
        get :student_entrance_point_types
        get :student_entrance_types
        get :student_grades
        get :student_grading_systems
        get :student_punishment_types
        get :student_studentship_rights
        get :student_studentship_statuses
        get :term_types
        get :unit_instruction_languages
        get :unit_instruction_types
        get :unit_statuses
        get :unit_types
        get :university_types
      end
    end

    resources :prospectives, only: %i[] do
      collection do
        get :students

        scope :students do
          get :photo, to: 'prospectives#photo'
        end
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
