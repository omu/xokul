# frozen_string_literal: true

desc 'Fetch all nationalities from YOKSIS'
task :nationalities do
  staff = Services::Yoksis::Staff.new(
    basic_auth: [Yoksis.client_id, Yoksis.client_secret]
  )

  Rails.logger.info 'Fetching nationalities...'
  nationalities = staff.nationalities

  nationalities.each do |nationality|
    Rails.logger.info "Processing... [#{nationality[:kod]}]"

    model_data = {
      kod: nationality[:kod].to_i,
      ad: nationality[:ad]
    }

    found = Nationality.find_by(kod: nationality[:kod])
    if found
      Rails.logger.info 'Found in database. Updating...'
      found.update(model_data)
    else
      Rails.logger.info 'Creating nationality...'
      Nationality.create(model_data)
    end
  end
end
