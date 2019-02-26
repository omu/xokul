# frozen_string_literal: true

module Services
  module Yoksis
    class References < Endpoint
      configure do |config|
        config.synopsis = 'YOKSIS Referanslar endpoint'
        config.version  = '1'
        config.url      = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'
      end

      def administrative_functions
        client.request(:get_personel_gorev)
      end

      def administrative_units
        client.request(:get_idari_birimler)
      end

      def countries
        client.request(:get_mernis_ulke)
      end

      def cities
        client.request(:get_il_getir)
      end

      def districts(city_code)
        client.request(:get_ilce_getir, message: { ILKODU: city_code })
      end

      def entrance_types
        client.request(:get_ilce_getir)
      end

      def gender
        client.request(:get_mernis_cinsiyet)
      end

      def martyrs_relatives
        client.request(:get_ogrenci_gazi_sehit_yakini)
      end

      def nationalities
        client.request(:get_mernis_uyruk)
      end

      def staff_titles
        client.request(:get_kadro_gorev_unvan)
      end

      def student_disability_types
        client.request(:get_ogrenci_engel_turu)
      end

      def student_dropout_types
        client.request(:get_ogrenci_ayrilma_nedeni)
      end

      def student_education_levels
        client.request(:get_ogrenci_doykm)
      end

      def student_entrance_point_types
        client.request(:get_ogrenci_giris_puan_turu)
      end

      def student_entrance_types
        client.request(:get_ogrenci_giris_turu)
      end

      def student_grades
        client.request(:get_ogrenci_sinif)
      end

      def student_grading_systems
        client.request(:get_ogrenci_diploma_not_sistemi)
      end

      def student_punishment_types
        client.request(:get_ceza_turu)
      end

      def student_studentship_rights
        client.request(:get_ogrenci_ogrencilik_hakki)
      end

      def unit_instruction_languages
        client.request(:get_ogrenim_dili)
      end

      def unit_instruction_types
        client.request(:get_ogrenim_turu)
      end

      def unit_statuses
        client.request(:get_aktiflik_durumu)
      end

      def unit_types
        client.request(:get_birim_turu)
      end

      def university_types
        client.request(:get_universite_turu)
      end
    end
  end
end
