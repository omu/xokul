# frozen_string_literal: true

namespace :daily do
  desc 'Fetch academicians from YOKSIS'
  task :fetch_academicians do
    client_id     = Rails.application.credentials.yoksis[:client_id]
    client_secret = Rails.application.credentials.yoksis[:client_secret]
    
    staff = Services::Yoksis::Staff.new(
      basic_auth: [client_id, client_secret]
    )
    
    total_pages = staff.total_pages(querier: client_id)

    pages = []
    [*1..total_pages.to_i].each do |page|
      warn "Fetching page: #{page}"
      pages << staff.pages(querier: client_id, page: page)
    end
	
    pages.flatten.each do |academician|
      warn "Processing academician: #{academician[:tc_kimlik_no]}"

      found = Academician.find_by(tc_kimlik_no: academician[:tc_kimlik_no])
      if found
        warn '  -> Found in database. Updating...'

        found.update(
          tc_kimlik_no: academician[:tc_kimlik_no],
          adi: academician[:adi],
          soyadi: academician[:soyadi],
          kadro_unvan: academician[:kadro_unvan],
          birim_id: academician[:birim_id].to_i
        )

        next
      end

      warn '  -> No record found in database. Creating...'
      Academician.create(
        tc_kimlik_no: academician[:tc_kimlik_no],
        adi: academician[:adi],
        soyadi: academician[:soyadi],
        kadro_unvan: academician[:kadro_unvan],
        birim_id: academician[:birim_id].to_i
      )
	  end
  end
end
