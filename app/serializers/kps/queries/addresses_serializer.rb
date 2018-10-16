# frozen_string_literal: true

module Kps
  module Queries
    class AddressesSerializer < Serializer
      attribute(:id_number) { integer object[:kimlik_no] }

      attribute :current_address do
        address = object[:yerlesim_yeri_adresi]

        {
          full_address:           string(address[:acik_adres]),
          no:                     integer(address[:adres_no]),
          type: {
            code:                 integer(address.dig(:adres_tip, :kod)),
            description:          string(address.dig(:adres_tip, :aciklama))
          },
          city_and_district_addresses: {
            independent_unit_status: {
              code:               integer(address.dig(:il_ilce_merkez_adresi, :bagimsiz_bolum_durum, :kod)),
              description:        string(address.dig(:il_ilce_merkez_adresi, :bagimsiz_bolum_durum, :aciklama))
            },
            dependent_unit_type: {
              code:               integer(address.dig(:il_ilce_merkez_adresi, :bagimsiz_bolum_tipi, :kod)),
              description:        string(address.dig(:il_ilce_merkez_adresi, :bagimsiz_bolum_tipi, :aciklama))
            },
            apartment: {
              block:              string(address.dig(:il_ilce_merkez_adresi, :bina_ada)),
              pilot:              string(address.dig(:il_ilce_merkez_adresi, :bina_parsel)),
              layout:             string(address.dig(:il_ilce_merkez_adresi, :bina_pafta)),
              block_name:         string(address.dig(:il_ilce_merkez_adresi, :bina_blok_adi)),
              code:               integer(address.dig(:il_ilce_merkez_adresi, :bina_kodu)),
              no:                 integer(address.dig(:il_ilce_merkez_adresi, :bina_no)),
              site_name:          string(address.dig(:il_ilce_merkez_adresi, :bina_site_adi)),
              status: {
                code:             integer(address.dig(:il_ilce_merkez_adresi, :bina_durum, :kod)),
                description:      string(address.dig(:il_ilce_merkez_adresi, :bina_durum, :aciklama))
              },
              numbering_type: {
                code:             integer(address.dig(:il_ilce_merkez_adresi, :bina_numarataj_tipi, :kod)),
                description:      string(address.dig(:il_ilce_merkez_adresi, :bina_numarataj_tipi, :aciklama))
              },
              structure_type: {
                code:             integer(address.dig(:il_ilce_merkez_adresi, :bina_yapi_tipi, :kod)),
                description:      string(address.dig(:il_ilce_merkez_adresi, :bina_yapi_tipi, :aciklama))
              }
            },
            csbm:                 string(address.dig(:il_ilce_merkez_adresi, :csbm)),
            csbm_code:            integer(address.dig(:il_ilce_merkez_adresi, :csbm_kodu)),
            exterior_door_no:     integer(address.dig(:il_ilce_merkez_adresi, :dis_kapi_no)),
            interior_door_no:     integer(address.dig(:il_ilce_merkez_adresi, :ic_kapi_no)),
            city: {
              code:               integer(address.dig(:il_ilce_merkez_adresi, :il_kodu)),
              name:               string(address.dig(:il_ilce_merkez_adresi, :il))
            },
            district: {
              code:               integer(address.dig(:il_ilce_merkez_adresi, :ilce_kodu)),
              name:               string(address.dig(:il_ilce_merkez_adresi, :ilce))
            },
            neighborhood: {
              code:               integer(address.dig(:il_ilce_merkez_adresi, :mahalle_kodu)),
              name:               string(address.dig(:il_ilce_merkez_adresi, :mahalle))
            },
            reason_of_stucture_use: {
              code:               integer(address.dig(:il_ilce_merkez_adresi, :yapi_kullanim_amac, :kod)),
              name:               string(address.dig(:il_ilce_merkez_adresi, :yapi_kullanim_amac, :aciklama))
            },
          },
          village_address:        string(address[:koy_adresi]),
          abroad_address:         string(address[:yurt_disi_adresi]),
          reason_of_relocation:   string(address[:tasinma_neden]),
          municipality_address:   string(address[:belde_adresi]),
          declarant_id_number:    integer(address[:beyanda_bulunan_kimlik_no]),
          date_of_relocation:     build_date(*address[:tasinma_tarihi].values_at(:yil, :ay, :gun)),
          date_of_declaration:    build_date(*address[:beyan_tarihi].values_at(:yil, :ay, :gun)),
          date_of_registration:   build_date(*address[:tescil_tarihi].values_at(:yil, :ay, :gun))
        }
      end

      attribute :other_addresses do
        tmp = object.dig(:diger_adres_bilgileri, :kimlik_noile_kisi_adres_bilgisi)

        addresses = [tmp[:item] || tmp].flatten.each_with_object([]) do |address, object|
          next if address[:hata_bilgisi]

          object << {
            declarant_id_number:  integer(address[:beyanda_bulunan_kimlik_no]),
            full_address:         string(address[:acik_adres]),
            address_no:           integer(address[:adres_no]),
            address_type: {
              code:               integer(address.dig(:adres_tip, :kod)),
              description:        string(address.dig(:adres_tip, :aciklama))
            },
            village_address:      string(address[:koy_adresi]),
            municipality_address: string(address[:belde_adresi]),
            city_address:         string(address[:il_ilce_merkez_adresi]),
            abroad_address:       string(address[:yurt_disi_adresi]),
            reason_of_relocation: string(address[:tasinma_neden]),
            date_of_relocation:   build_date(*address[:tasinma_tarihi].values_at(:yil, :ay, :gun)),
            date_of_declaration:  build_date(*address[:beyan_tarihi].values_at(:yil, :ay, :gun)),
            date_of_registration: build_date(*address[:tescil_tarihi].values_at(:yil, :ay, :gun))
          }
        end

        nil if addresses.empty?
      end
    end
  end
end