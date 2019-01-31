# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
desc 'Fetch all academicians from YOKSIS'
task :academicians do
  staff = Services::Yoksis::Staff.new(
    basic_auth: [Yoksis.client_id, Yoksis.client_secret]
  )

  academicians = []
  total_pages = staff.total_pages(querier: Yoksis.client_id)

  [*1..total_pages.to_i].each do |page|
    Rails.logger.info "Fetching... [page #{page}]"
    academicians << staff.pages(querier: Yoksis.client_id, page: page)
  end

  academicians.flatten.each do |academician|
    Rails.logger.info "Processing... [#{academician[:tc_kimlik_no]}]"

    model_data = {
      tc_kimlik_no: academician[:tc_kimlik_no],
      adi: academician[:adi],
      soyadi: academician[:soyadi],
      kadro_unvan: academician[:kadro_unvan],
      birim_id: academician[:birim_id].to_i
    }

    found = Academician.find_by(tc_kimlik_no: academician[:tc_kimlik_no])
    if found
      Rails.logger.info 'Found in database. Updating...'
      found.update(model_data)
    else
      Rails.logger.info 'Creating academician...'
      Academician.create(model_data)
    end
  end
end
# rubocop:enable Metrics/BlockLength
