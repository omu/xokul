# frozen_string_literal: true

module Kps
  module Queries
    class AddressesSerializer < Serializer
      attribute(:id_number)            { object[:kimlik_no].safe_to_i                       }
      attribute(:full_address)         { object[:yerlesim_yeri_adresi][:acik_adres]         }
      attribute(:address_no)           { object[:yerlesim_yeri_adresi][:adres_no].safe_to_i }
      attribute(:reason_of_relocation) { object[:yerlesim_yeri_adresi][:tasinma_neden]      }
      attribute(:village_address)      { object[:yerlesim_yeri_adresi][:koy_adresi]         }
      attribute(:municipality_address) { object[:yerlesim_yeri_adresi][:belde_adresi]       }
      attribute(:abroad_address)       { object[:yerlesim_yeri_adresi][:yurt_disi_adresi]   }

      attribute :other_address_informations do
        tmp = object.dig(:diger_adres_bilgileri, :kimlik_noile_kisi_adres_bilgisi)
        next if tmp[:hata_bilgisi].present?
        {
          declarant_id_number: tmp[:beyanda_bulunan_kimlik_no].safe_to_i,
          full_address:        tmp[:acik_adres],
          address_no:          tmp[:adres_no].safe_to_i,
          address_type: {
            code:        tmp.dig(:adres_tip, :kod),
            description: tmp.dig(:adres_tip, :aciklama)
          },
          village_address:      tmp[:koy_adresi],
          municipality_address: tmp[:belde_adresi],
          city_address:         tmp[:il_ilce_merkez_adresi],
          abroad_address:       tmp[:yurt_disi_adresi],
          reason_of_relocation: tmp[:tasinma_neden],
          date_of_relocation: build_date(
            *tmp[:tasinma_tarihi].values_at(:yil, :ay, :gun)
          ),
          date_of_declaration: build_date(
            *tmp[:beyan_tarihi].values_at(:yil, :ay, :gun)
          ),
          date_of_registration: build_date(
            *tmp[:tescil_tarihi].values_at(:yil, :ay, :gun)
          ),

        }
      end

      attribute :city_address do
        tmp = object.dig(:yerlesim_yeri_adresi, :il_ilce_merkez_adresi)
        {
          independent_unit_status: {
            code:        tmp[:bagimsiz_bolum_durum][:kod].safe_to_i,
            description: tmp[:bagimsiz_bolum_durum][:description]
          },
          dependent_unit_type: {
            code:        tmp[:bagimsiz_bolum_tipi][:kod].safe_to_i,
            description: tmp[:bagimsiz_bolum_tipi][:description]
          },
          apartment: {
            block:      tmp[:bina_ada],
            pilot:      tmp[:bina_parsel],
            layout:     tmp[:bina_pafta],
            block_name: tmp[:bina_blok_adi],
            code:       tmp[:bina_kodu].safe_to_i,
            no:         tmp[:bina_no].safe_to_i,
            site_name:  tmp[:bina_site_adi],
            status: {
              code:        tmp[:bina_durum][:kod].safe_to_i,
              description: tmp[:bina_durum][:description]
            },
            numbering_type: {
              code:        tmp[:bina_numarataj_tipi][:kod].safe_to_i,
              description: tmp[:bina_numarataj_tipi][:description]
            },
            structure_type: {
              code:        tmp[:bina_yapi_tipi][:kod].safe_to_i,
              description: tmp[:bina_yapi_tipi][:description]
            }
          },
          csbm:             tmp[:csbm],
          csbm_code:        tmp[:csbm_kodu].safe_to_i,
          exterior_door_no: tmp[:dis_kapi_no].safe_to_i,
          interior_door_no: tmp[:ic_kapi_no].safe_to_i,
          city: {
            code: tmp[:il_kodu].safe_to_i,
            name: tmp[:il],
          },
          district: {
            code: tmp[:ilce_kodu].safe_to_i,
            name: tmp[:ilce],
          },
          neighborhood: {
            code: tmp[:mahalle_kodu].safe_to_i,
            name: tmp[:mahalle],
          },
          reason_of_stucture_use: {
            code: tmp[:yapi_kullanim_amac][:kod].safe_to_i,
            name: tmp[:yapi_kullanim_amac][:aciklama],
          },
        }
      end

      attribute :address_type do
        {
          code:        object[:yerlesim_yeri_adresi][:adres_tip],
          description: object[:yerlesim_yeri_adresi][:aciklama]
        }
      end

      attribute :date_of_relocation do
        build_date(
          *object[:yerlesim_yeri_adresi][:tasinma_tarihi].values_at(:yil, :ay, :gun)
        )
      end

      attribute :date_of_declaration do
        build_date(
          *object[:yerlesim_yeri_adresi][:beyan_tarihi].values_at(:yil, :ay, :gun)
        )
      end

      attribute :date_of_registration do
        build_date(
          *object[:yerlesim_yeri_adresi][:tescil_tarihi].values_at(:yil, :ay, :gun)
        )
      end
    end
  end
end