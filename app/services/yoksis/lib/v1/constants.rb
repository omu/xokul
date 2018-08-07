# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      GRADUATE_METHODS = {
        status:                            :tc_kimlik_noil_mezun_ogrenci_sorgulav2,
      }.freeze
      MEB_METHODS = {
        graduation_data:                   :mezuniyet_verilerini_getir,
        detailed_graduation_data:          :mezuniyet_verilerini_getir_detay,
      }
      REFERENCES_METHODS = {
        administrative_function:           :get_personel_gorev,
        administrative_units:              :get_idari_birimler,
        country:                           :get_mernis_ulke,
        entrance_type:                     :get_giris_turu,
        gender:                            :get_mernis_cinsiyet,
        kod_bid:                           :get_kod_bid,
        martyrs_relatives:                 :get_ogrenci_gazi_sehit_yakini,
        nationality:                       :get_mernis_uyruk,
        province:                          :get_il_getir,
        staff_title:                       :get_kadro_gorev_unvan,
        student_disability_type:           :get_ogrenci_engel_turu,
        student_dropout_type:              :get_ogrenci_ayrilma_nedeni,
        student_education_level:           :get_ogrenci_doykm,
        student_entrance_point_type:       :get_ogrenci_giris_puan_turu,
        student_entrance_type:             :get_ogrenci_giris_turu,
        student_grade:                     :get_ogrenci_sinif,
        student_grading_system:            :get_ogrenci_diploma_not_sistemi,
        student_punishment_type:           :get_ceza_turu,
        studentship_right:                 :get_ogrenci_ogrencilik_hakki,
        studentship_status:                :get_ogrencilik_statusu,
        unit_instruction_language:         :get_ogrenim_dili,
        unit_instruction_type:             :get_ogrenim_turu,
        unit_status:                       :get_aktiflik_durumu,
        unit_type:                         :get_birim_turu,
        university_type:                   :get_universite_turu,
      }.freeze
      REGISTRATIONS_METHODS = {
        foundation_tuition:                :vakif_ogrenim_ucretiv1,
        query_by_date:                     :belirtilen_gun_online_kayit_olan_ogrenciler_getirv1,
        query_by_tck:                      :tc_kimlik_no_ile_online_kayit_ogrenci_bilgi_getirv1,
      }.freeze
      STAFF_METHODS = {
        information_by_tck:                :kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1,
        information:                       :kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1,
        nationalities:                     :get_mernis_uyruk,
        page_number:                       :kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1,
      }.freeze
      STUDENT_METHODS = {
        detailed:                          :tc_kimlik_noile_ogrenci_sorgula_detayv4,
      }.freeze
      UNITS_METHODS = {
        changes_in_unit:                   :tarihten_birim_degisiklik_getirv4,
        programs_under_subunit:            :alt_birimdeki_programlari_getirv4,
        subunits:                          :alt_birimleri_getirv4,
        universities:                      :universiteleri_getirv4,
      }.freeze
      GRADUATE_RESULT_PATHS = {
        status:                            :tc_kimlik_noil_mezun_ogrenci_sorgulav2_response,
      }.freeze
      MEB_RESULT_PATHS = {
        graduation_data:                 [ :mezuniyet_verilerini_getir_response,
                                           :mezuniyet_verilerini_getir_result                           ],
        detailed_graduation_data:        [ :mezuniyet_verilerini_getir_detay_response,
                                           :mezuniyet_verilerini_getir_detay_result,
                                           :mezuniyet_veri_listesi_detay, :mezuniyet_veri_listesi_detay ],
      }.freeze
      REFERENCES_RESULT_PATHS = {
        administrative_function:         [ :get_personel_gorev_response, :referanslar              ],
        administrative_units:            [ :get_idari_birimler_response, :idari_birimler           ],
        country:                         [ :get_mernis_ulke_response, :referanslar                 ],
        district:                        [ :get_ilce_getir_response, :ilce_kodlari                 ],
        entrance_type:                   [ :get_giris_turu_response, :referanslar                  ],
        gender:                          [ :get_mernis_cinsiyet_response, :referanslar             ],
        kod_bid:                         [ :get_kod_bid_response, :referanslar                     ],
        martyrs_relatives:               [ :get_ogrenci_gazi_sehit_yakini_response, :referanslar   ],
        nationality:                     [ :get_mernis_uyruk_response, :referanslar                ],
        province:                        [ :get_il_getir_response, :il_kodu                        ],
        staff_title:                     [ :get_kadro_gorev_unvan_response, :referanslar           ],
        student_disability_type:         [ :get_ogrenci_engel_turu_response, :referanslar          ],
        student_dropout_type:            [ :get_ogrenci_ayrilma_nedeni_response, :referanslar      ],
        student_education_level:         [ :get_ogrenci_doykm_response, :referanslar               ],
        student_entrance_point_type:     [ :get_ogrenci_giris_puan_turu_response, :referanslar     ],
        student_entrance_type:           [ :get_ogrenci_giris_turu_response, :referanslar          ],
        student_grade:                   [ :get_ogrenci_sinif_response, :referanslar               ],
        student_grading_system:          [ :get_ogrenci_diploma_not_sistemi_response, :referanslar ],
        student_punishment_type:         [ :get_ceza_turu_response, :referanslar                   ],
        studentship_right:               [ :get_ogrenci_ogrencilik_hakki_response, :referanslar    ],
        studentship_status:              [ :get_ogrencilik_statusu_response, :referanslar          ],
        unit_instruction_language:       [ :get_ogrenim_dili_response, :referanslar                ],
        unit_instruction_type:           [ :get_ogrenim_turu_response, :referanslar                ],
        unit_status:                     [ :get_aktiflik_durumu_response, :referanslar             ],
        unit_type:                       [ :get_birim_turu_response, :referanslar                  ],
        university_type:                 [ :get_universite_turu_response, :referanslar             ],
      }.freeze
      REGISTRATIONS_RESULT_PATHS = {
        foundation_tuition:              [ :vakif_ogrenim_ucretiv1_response, :sonuc                              ],
        query_by_date:                   [ :tc_kimlik_no_ile_online_kayit_ogrenci_bilgi_getirv1_response, :sonuc ],
        query_by_tck:                    [ :belirtilen_gun_online_kayit_olan_ogrenciler_getirv1_response, :sonuc ],
      }.freeze
      STAFF_RESULT_PATHS = {
        information_by_tck:              [ :kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1_response,
                                           :akademik_personel                                                        ],
        information:                     [ :kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response,
                                           :akademik_personeller                                                     ],
        nationalities:                   [ :get_mernis_uyruk_response, :referanslar                                  ],
        page_number:                     [ :kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1_response,
                                           :toplam_sayfa_sayisi                                                      ],

      }
      STUDENT_RESULT_PATHS = {
        detailed:                        [ :tc_kimlik_noile_ogrenci_sorgula_detayv4_response, :ogrenci_kayitlari ],
      }
      UNITS_RESULT_PATHS = {
        changes_in_unit:                 [ :tarihten_birim_degisiklik_getirv4_response, :birimler ],
        subunits:                        [ :alt_birimleri_getirv4_response, :birimler             ],
        universities:                    [ :universiteleri_getirv4_response, :universiteler       ],
        programs_under_subunit:          [ :alt_birimdeki_programlari_getirv4_response, :birimler ],
      }
    end
  end
end
