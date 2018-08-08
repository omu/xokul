# frozen_string_literal: true

module Yoksis
  module Meb
    class DetailedGraduationDataSerializer < ActiveModel::Serializer
      attribute(:id_number)          { object[:tckimlikno]       }
      attribute(:firs_tname)         { object[:adi]              }
      attribute(:last_name)          { object[:soyadi]           }
      attribute(:school_id)          { object[:okulkodu]         }
      attribute(:school_name)        { object[:okuladi]          }
      attribute(:okul_alan_kodu)     { object[:okulalankodu]     }
      attribute(:okul_alan_adi)      { object[:okulalanadi]      }
      attribute(:okul_dal_kodu)      { object[:okuldalkodu]      }
      attribute(:okul_dal_adi)       { object[:okuldaladi]       }
      attribute(:okul_birincisi)     { object[:okulbirincisi]    }
      attribute(:okul_il_adi)        { object[:okuliladi]        }
      attribute(:okul_il_kodu)       { object[:okulilkodu]       }
      attribute(:okul_ilce_adi)      { object[:okulilceadi]      }
      attribute(:okul_ilce_kodu)     { object[:okulilcekodu]     }
      attribute(:ogrenim_turu)       { object[:ogrenimturu]      }
      attribute(:mezun_durumu_kodu)  { object[:mezundurumukodu]  }
      attribute(:mezun_durumu)       { object[:mezundurumu]      }
      attribute(:mezuniyet_tarih)    { object[:mezuniyettarih]   }
      attribute(:not_sistemi)        { object[:notsistemi]       }
      attribute(:diploma_notu_puani) { object[:diplomanotupuani] }
    end
  end
end
