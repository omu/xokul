# frozen_string_literal: true

module Kps
  module Queries
    class AddressesSerializer < Serializer
      attribute(:id_number) { object[:kimlik_no].safe_to_i }

      attribute :current_address do
        address = object[:yerlesim_yeri_adresi]

        {
          full_address:           address[:acik_adres],
          no:                     address[:adres_no].safe_to_i,
          type: {
            code:                 address.dig(:adres_tip, :kod).safe_to_i,
            description:          address.dig(:adres_tip, :aciklama)
          },
          city_and_district_addresses: {
            independent_unit_status: {
              code:               address.dig(:il_ilce_merkez_adresi, :bagimsiz_bolum_durum, :kod).safe_to_i,
              description:        address.dig(:il_ilce_merkez_adresi, :bagimsiz_bolum_durum, :aciklama)
            },
            dependent_unit_type: {
              code:               address.dig(:il_ilce_merkez_adresi, :bagimsiz_bolum_tipi, :kod).safe_to_i,
              description:        address.dig(:il_ilce_merkez_adresi, :bagimsiz_bolum_tipi, :aciklama)
            },
            apartment: {
              block:              address.dig(:il_ilce_merkez_adresi, :bina_ada),
              pilot:              address.dig(:il_ilce_merkez_adresi, :bina_parsel),
              layout:             address.dig(:il_ilce_merkez_adresi, :bina_pafta),
              block_name:         address.dig(:il_ilce_merkez_adresi, :bina_blok_adi),
              code:               address.dig(:il_ilce_merkez_adresi, :bina_kodu).safe_to_i,
              no:                 address.dig(:il_ilce_merkez_adresi, :bina_no).safe_to_i,
              site_name:          address.dig(:il_ilce_merkez_adresi, :bina_site_adi),
              status: {
                code:             address.dig(:il_ilce_merkez_adresi, :bina_durum, :kod).safe_to_i,
                description:      address.dig(:il_ilce_merkez_adresi, :bina_durum, :aciklama)
              },
              numbering_type: {
                code:             address.dig(:il_ilce_merkez_adresi, :bina_numarataj_tipi, :kod).safe_to_i,
                description:      address.dig(:il_ilce_merkez_adresi, :bina_numarataj_tipi, :aciklama)
              },
              structure_type: {
                code:             address.dig(:il_ilce_merkez_adresi, :bina_yapi_tipi, :kod).safe_to_i,
                description:      address.dig(:il_ilce_merkez_adresi, :bina_yapi_tipi, :aciklama)
              }
            },
            csbm:                 address.dig(:il_ilce_merkez_adresi, :csbm),
            csbm_code:            address.dig(:il_ilce_merkez_adresi, :csbm_kodu).safe_to_i,
            exterior_door_no:     address.dig(:il_ilce_merkez_adresi, :dis_kapi_no).safe_to_i,
            interior_door_no:     address.dig(:il_ilce_merkez_adresi, :ic_kapi_no).safe_to_i,
            city: {
              code:               address.dig(:il_ilce_merkez_adresi, :il_kodu).safe_to_i,
              name:               address.dig(:il_ilce_merkez_adresi, :il)
            },
            district: {
              code:               address.dig(:il_ilce_merkez_adresi, :ilce_kodu).safe_to_i,
              name:               address.dig(:il_ilce_merkez_adresi, :ilce)
            },
            neighborhood: {
              code:               address.dig(:il_ilce_merkez_adresi, :mahalle_kodu).safe_to_i,
              name:               address.dig(:il_ilce_merkez_adresi, :mahalle)
            },
            reason_of_stucture_use: {
              code:               address.dig(:il_ilce_merkez_adresi, :yapi_kullanim_amac, :kod).safe_to_i,
              name:               address.dig(:il_ilce_merkez_adresi, :yapi_kullanim_amac, :aciklama)
            },
          },
          village_address:        address[:koy_adresi],
          abroad_address:         address[:yurt_disi_adresi],
          reason_of_relocation:   address[:tasinma_neden],
          municipality_address:   address[:belde_adresi],
          declarant_id_number:    address[:beyanda_bulunan_kimlik_no].safe_to_i,
          date_of_relocation:     address[:tasinma_tarihi] && build_date(*address[:tasinma_tarihi].values_at(:yil, :ay, :gun)),
          date_of_declaration:    address[:beyan_tarihi]   && build_date(*address[:beyan_tarihi].values_at(:yil, :ay, :gun)),
          date_of_registration:   address[:tescil_tarihi]  && build_date(*address[:tescil_tarihi].values_at(:yil, :ay, :gun))
        }
      end

      attribute :other_addresses do
        tmp = object.dig(:diger_adres_bilgileri, :kimlik_noile_kisi_adres_bilgisi)

        addresses = [tmp[:item] || tmp].flatten.each_with_object([]) do |address, object|
          next if address[:hata_bilgisi]

          object << {
            declarant_id_number:  address[:beyanda_bulunan_kimlik_no].safe_to_i,
            full_address:         address[:acik_adres],
            address_no:           address[:adres_no].safe_to_i,
            address_type: {
              code:               address.dig(:adres_tip, :kod),
              description:        address.dig(:adres_tip, :aciklama)
            },
            village_address:      address[:koy_adresi],
            municipality_address: address[:belde_adresi],
            city_address:         address[:il_ilce_merkez_adresi],
            abroad_address:       address[:yurt_disi_adresi],
            reason_of_relocation: address[:tasinma_neden],
            date_of_relocation:   address[:tasinma_tarihi] && build_date(*address[:tasinma_tarihi].values_at(:yil, :ay, :gun)),
            date_of_declaration:  address[:beyan_tarihi]   && build_date(*address[:beyan_tarihi].values_at(:yil, :ay, :gun)),
            date_of_registration: address[:tescil_tarihi]  && build_date(*address[:tescil_tarihi].values_at(:yil, :ay, :gun))
          }
        end

        nil if addresses.empty?
      end
    end
  end
end