# frozen_string_literal: true

module Meksis
  class AdministrativeDepartmentsSerializer < Serializer
    attribute(:unit_id)            { integer object['AkademikIdariBolumID']           }
    attribute(:unit_name)          { string  object['AkademikIdariBolumAdi']          }
    attribute(:number_of_staff)    { integer object['PersonelSayisi']                 }
    attribute(:number_of_students) { integer object['OgrenciSayisi']                  }
    attribute(:active)             { boolean object['Aktifmi'].eql?(1) ? true : false }
  end
end
