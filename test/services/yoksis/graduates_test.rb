# frozen_string_literal: true

require 'test_helper'

module Yoksis
  class Graduates < ActiveSupport::TestCase
    setup do
      @graduates = Services::Yoksis::Graduates.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    # rubocop:disable Metrics/BlockLength
    test 'Check presence of required keys in informations response' do
      VCR.use_cassette('yoksis/graduates/informations') do
        required_keys = %i[
          tckno
          adi
          soyadi
          anne_adi
          baba_adi
          dogum_tarihi
          mezuniyet_tarihi
          diploma_notu
          diploma_not_sistemi
          diploma_no
          universite_adi
          fak_myo_yo_ens
          program_adi
          univ_id
          birim_id
          alt_program
          durum
        ]
        test_data1 = @graduates.informations(
          id_number: Rails.application.credentials.tests[:graduated_id_number1]
        )
        test_data2 = @graduates.informations(
          id_number: Rails.application.credentials.tests[:graduated_id_number2]
        )

        assert test_data1.keys == required_keys
        test_data2.each { |data| assert data.keys == required_keys }
      end
    end
    # rubocop:enable Metrics/BlockLength
  end
end
