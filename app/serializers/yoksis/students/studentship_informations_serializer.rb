# frozen_string_literal: true

module Yoksis
  module Students
    class StudentshipInformationsSerializer < Serializer
      attribute(:student_number) { object.dig(:ogrenci_no).try(:to_i)  }
      attribute(:entrance_point) { object.dig(:giris_puani).try(:to_i) }
      attribute(:registration_date) do
        build_time(
          *object.dig(:kayit_tarihi).values_at(:yil, :ay, :gun, :saat, :dakika, :saniye)
        )
      end
      attribute(:current_term) { object.dig(:aktif_donem_no).try(:to_i)     }
      attribute(:akts)         { object.dig(:akts).try(:to_f)               }
      attribute(:prep_term)    { object.dig(:kac_donem_hazirlik).try(:to_i) }
      attribute(:prep_class) do
        {
          code: object.dig(:hazirlik_sinifi, :kod).try(:to_i),
          name: object.dig(:hazirlik_sinifi, :ad)
        }
      end
      attribute(:entrance_point_type) do
        {
          code: object.dig(:giris_puan_turu, :kod).try(:to_i),
          name: object.dig(:giris_puan_turu, :ad)
        }
      end
      attribute(:entrance_type) do
        {
          code: object.dig(:giris_turu, :kod).try(:to_i),
          name: object.dig(:giris_turu, :ad)
        }
      end
      attribute(:rights) do
        {
          code: object.dig(:ogrencilik_hakki_varmi, :kod).try(:to_i),
          name: object.dig(:ogrencilik_hakki_varmi, :ad)
        }
      end
      attribute(:end_date_of_studentship_right) do
        build_date(
          *object.dig(:ogrencilik_hakki_bitti_tarih).values_at(:yil, :ay, :gun)
        )
      end
      attribute(:status) do
        {
          code: object.dig(:ogrencilik_statusu, :kod).try(:to_i),
          name: object.dig(:ogrencilik_statusu, :ad)
        }
      end
      attribute(:disability_type) do
        {
          code: object.dig(:engel_turu, :kod).try(:to_i),
          name: object.dig(:engel_turu, :ad)
        }
      end
      attribute(:disability_rate) { object.dig(:engel_orani).try(:to_i) }
      attribute(:dropout_type) do
        {
          code: object.dig(:ayrilma_nedeni, :kod).try(:to_i),
          name: object.dig(:ayrilma_nedeni, :ad)
        }
      end
      attribute(:dropout_date) do
        build_date(
          *object.dig(:ayrilma_tarihi).values_at(:yil, :ay, :gun)
        )
      end
      attribute(:martyrs_relative) do
        {
          code: object.dig(:gazi_sehit_yakini, :kod).try(:to_i),
          name: object.dig(:gazi_sehit_yakini, :ad)
        }
      end
      attribute(:diploma) do
        {
          gpa: object.dig(:diploma, :notu).try(:to_f),
          grading_system: object.dig(:diploma, :not_sistemi).try(:to_f),
          no: object.dig(:diploma, :no).try(:to_i)
        }
      end
    end
  end
end
