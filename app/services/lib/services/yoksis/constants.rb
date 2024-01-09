# frozen_string_literal: true

module Services
  module Yoksis
    class Graduates < Base
      ARGS = {
        informations: {
          operation: :tc_kimlik_noil_mezun_ogrenci_sorgulav2,
          result: %i[tc_kimlik_noil_mezun_ogrenci_sorgulav2_response mezun_ogrenci_kayitlari],
          status: %i[tc_kimlik_noil_mezun_ogrenci_sorgulav2_response sonuc durum_aciklama]
        }
      }.freeze
    end
    class MEB < Base
      ARGS = {
        students: {
          operation: :mezuniyet_verilerini_getir_detay,
          result: %i[
            mezuniyet_verilerini_getir_detay_response mezuniyet_verilerini_getir_detay_result
            mezuniyet_veri_listesi_detay mezuniyet_veri_listesi_detay
          ],
          status: %i[
            mezuniyet_verilerini_getir_detay_response mezuniyet_verilerini_getir_detay_result
            sonuckodu
          ]
        }
      }.freeze
    end
    class References < Base
      reference_parameters = {
        operation: :referans_deger,
        result: %i[referans_deger_response referans],
        status: %i[referans_deger_response sonuc sonuc_kod],
      }
      ARGS = {
        academic_year: reference_parameters.merge(code: 31),
        administrative_functions: reference_parameters.merge(code: 26),
        cities: reference_parameters.merge(code: 29),
        countries: reference_parameters.merge(code: 8),
        course_register_types: reference_parameters.merge(code: 34),
        course_status: reference_parameters.merge(code: 33),
        course_term: reference_parameters.merge(code: 35),
        credit_types: reference_parameters.merge(code: 38),
        final_status: reference_parameters.merge(code: 37),
        formations: reference_parameters.merge(code: 5),
        gender: reference_parameters.merge(code: 10),
        indexes: reference_parameters.merge(code: 4),
        kod_bid: reference_parameters.merge(code: 7),
        martyrs_relatives: reference_parameters.merge(code: 15),
        nationalities: reference_parameters.merge(code: 9),
        staff_duty_types: reference_parameters.merge(code: 26),
        staff_appointment_types: reference_parameters.merge(code: 24),
        staff_dropout_types: reference_parameters.merge(code: 25),
        staff_titles: reference_parameters.merge(code: 6),
        student_disability_types: reference_parameters.merge(code: 14),
        student_drop_out_types: reference_parameters.merge(code: 11),
        student_education_levels: reference_parameters.merge(code: 13),
        student_entrance_point_types: reference_parameters.merge(code: 16),
        student_entrance_types: reference_parameters.merge(code: 17),
        student_grades: reference_parameters.merge(code: 20),
        student_grading_systems: reference_parameters.merge(code: 12),
        student_punishment_types: reference_parameters.merge(code: 2),
        student_studentship_rights: reference_parameters.merge(code: 18),
        student_studentship_statuses: reference_parameters.merge(code: 19),
        term: reference_parameters.merge(code: 36),
        unit_instruction_languages: reference_parameters.merge(code: 21),
        unit_instruction_types: reference_parameters.merge(code: 22),
        unit_statuses: reference_parameters.merge(code: 0),
        unit_types: reference_parameters.merge(code: 1),
        university_types: reference_parameters.merge(code: 27),
        yoksis_country: reference_parameters.merge(code: 28),
        districts: {
          operation: :referans_alt_deger,
          code: 30,
          result: %i[referans_alt_deger_response referans],
          status: %i[referans_alt_deger_response sonuc sonuc_kod],
        },
      }.freeze
    end
    class Resumes < Base
      ARGS = {
        academic_duties: {
          operation: :getir_akademik_gorev_listesi,
          result: %i[getir_akademik_gorev_listesi_response akademik_gorev_listesi],
          status: %i[getir_akademik_gorev_listesi_response sonuc durum_kodu],
        },
        academic_links: {
          operation: :get_personel_link_v1,
          result: %i[get_personel_link_v1_response personel_link_liste],
          status: %i[get_personel_link_v1_response sonuc durum_kodu],
        },
        administrative_duties: {
          operation: :getir_idari_gorev_listesi,
          result: %i[getir_idari_gorev_listesi_response idari_gorev_listesi],
          status: %i[getir_idari_gorev_listesi_response sonuc durum_kodu],
        },
        articles: {
          operation: :get_makale_bilgisi_v1,
          result: %i[get_makale_bilgisi_v1_response makale_liste],
          status: %i[get_makale_bilgisi_v1_response sonuc durum_kodu]
        },
        artistic_activities: {
          operation: :get_sanatsal_faal_v1,
          result: %i[get_sanatsal_faal_v1_response sanatsal_faal_liste],
          status: %i[get_sanatsal_faal_v1_response sonuc durum_kodu]
        },
        authors: {
          operation: :get_yazar_listesi_v1,
          result: %i[get_yazar_listesi_v1_response yazarlar_listesi],
          status: %i[get_yazar_listesi_v1_response sonuc durum_kodu]
        },
        awards: {
          operation: :get_odul_listesi_v1,
          result: %i[get_odul_listesi_v1_response odul_listesi],
          status: %i[get_odul_listesi_v1_response sonuc durum_kodu]
        },
        books: {
          operation: :get_kitap_bilgisi_v1,
          result: %i[get_kitap_bilgisi_v1_response kitap_liste],
          status: %i[get_kitap_bilgisi_v1_response sonuc durum_kodu]
        },
        certifications: {
          operation: :get_arastirma_sertifka_bilgisi_v1,
          result: %i[get_arastirma_sertifka_bilgisi_v1_response arastirma_liste],
          status: %i[get_arastirma_sertifka_bilgisi_v1_response sonuc durum_kodu]
        },
        citations: {
          operation: :getir_atif_sayilari,
          result: %i[getir_atif_sayilari_response doc_atif_sayilari],
          status: %i[getir_atif_sayilari_response sonuc durum_kodu],
        },
        designs: {
          operation: :get_tasarim_bilgisi_v1,
          result: %i[get_tasarim_bilgisi_v1_response tasarim_liste],
          status: %i[get_tasarim_bilgisi_v1_response sonuc durum_kodu],
        },
        editorships: {
          operation: :get_editorluk_bilgisi_v1,
          result: %i[get_editorluk_bilgisi_v1_response editorluk_liste],
          status: %i[get_editorluk_bilgisi_v1_response sonuc durum_kodu],
        },
        education_informations: {
          operation: :getir_ogrenim_bilgisi_listesi,
          result: %i[getir_ogrenim_bilgisi_listesi_response ogrenim_bilgisi_listesi],
          status: %i[getir_ogrenim_bilgisi_listesi_response sonuc durum_kodu],
        },
        fields: {
          operation: :get_temel_alan_bilgisi_v1,
          result: %i[get_temel_alan_bilgisi_v1_response temel_alan_liste],
          status: %i[get_temel_alan_bilgisi_v1_response sonuc durum_kodu],
        },
        foreign_languages: {
          operation: :getir_yabanci_dil_listesi,
          result: %i[getir_yabanci_dil_listesi_response yabanci_dil_listesi],
          status: %i[getir_yabanci_dil_listesi_response sonuc durum_kodu],
        },
        incentive_applications: {
          operation: :getir_basvuru_durum,
          result: %i[getir_basvuru_durum_response basvuru_durum],
          status: %i[getir_basvuru_durum_response sonuc durum_kodu],
        },
        incentive_activity_declarations: {
          operation: :getir_beyan_tesvik,
          result: %i[getir_beyan_tesvik_response doc_tesvik_beyan],
          status: %i[getir_beyan_tesvik_response sonuc durum_kodu],
        },
        lectures: {
          operation: :getir_ders_listesi,
          result: %i[getir_ders_listesi_response ders_listesi],
          status: %i[getir_ders_listesi_response sonuc durum_kodu],
        },
        memberships: {
          operation: :getir_uyelik_listesi,
          result: %i[getir_uyelik_listesi_response uyelik_listesi],
          status: %i[getir_uyelik_listesi_response sonuc durum_kodu],
        },
        other_experiences: {
          operation: :getir_unv_disi_deneyim_listesi,
          result: %i[getir_unv_disi_deneyim_listesi_response deneyim_listesi],
          status: %i[getir_unv_disi_deneyim_listesi_response sonuc durum_kodu],
        },
        papers: {
          operation: :get_bildiri_bilgisi_v1,
          result: %i[get_bildiri_bilgisi_v1_response bildiri_liste],
          status: %i[get_bildiri_bilgisi_v1_response sonuc durum_kodu],
        },
        patents: {
          operation: :get_patent_bilgisi_v1,
          result: %i[get_patent_bilgisi_v1_response patent_liste],
          status: %i[get_patent_bilgisi_v1_response sonuc durum_kodu],
        },
        projects: {
          operation: :getir_proje_listesi,
          result: %i[getir_proje_listesi_response proje_listesi],
          status: %i[getir_proje_listesi_response sonuc durum_kodu]
        },
        refereeing: {
          operation: :get_hakemlik_bilgisi_v1,
          result: %i[get_hakemlik_bilgisi_v1_response hakemlik_liste],
          status: %i[get_hakemlik_bilgisi_v1_response sonuc durum_kodu]
        },
        thesis_advisors: {
          operation: :getir_tez_danisman_listesi,
          result: %i[getir_tez_danisman_listesi_response tez_danisman_listesi],
          status: %i[getir_tez_danisman_listesi_response sonuc durum_kodu]
        },
      }.freeze
    end
    class Staff < Base
      ARGS = {
        academicians: {
          operation: :kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1,
          result: %i[kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1_response
                     akademik_personel],
        },
        nationalities: {
          operation: :get_mernis_uyruk,
          result: %i[get_mernis_uyruk_response referanslar],
          status: %i[get_mernis_uyruk_response sonuc durum_aciklama],
        },
        pages: {
          operation: :kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1,
          result: %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                     akademik_personeller],
          status: %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                     sonuc durum_aciklama],
        },
        total_pages: {
          operation: :kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1,
          result: %i[kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1_response
                     toplam_sayfa_sayisi],
          status: %i[kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1_response
                     sonuc durum_aciklama],
        }
      }.freeze
    end
    class Students < Base
      ARGS = {
        informations: {
          operation: :tc_kimlik_noile_ogrenci_sorgula_detayv4,
          result: %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response ogrenci_kayitlari],
          status: %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response sonuc durum_aciklama],
        },
      }.freeze
    end
    class Units < Base
      ARGS = {
        changes: {
          operation: :birim_degisiklik,
          result: %i[birim_degisiklik_response birim],
          status: %i[birim_degisiklik_response sonuc sonuc_kod],
        },
        names: {
          operation: :birim,
          result: %i[birim_response birim],
          status: %i[birim_response sonuc sonuc_kod],
        },
        universities: {
          operation: :birim_universite,
          result: %i[birim_universite_response universite],
          status: %i[birim_universite_response sonuc sonuc_kod],
        },
        programs: {
          operation: :birim_program,
          result: %i[birim_program_response birim],
          status: %i[birim_program_response sonuc sonuc_kod],
        },
        subunits: {
          operation: :birim_tum_alt,
          result: %i[birim_tum_alt_response birim],
          status: %i[birim_tum_alt_response sonuc sonuc_kod],
        },
      }.freeze
    end
  end
end
