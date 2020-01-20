# frozen_string_literal: true

module Meksis
  class DepartmentsSerializer < Serializer
    attribute(:id)                 { integer object['AkademikIdariBolumID']           }
    attribute(:name)               { string  object['AkademikIdariBolumAdi']          }
    attribute(:unit_id)            { integer object['AkademikIdariBirimID'] }
    attribute(:number_of_staff)    { integer object['PersonelSayisi']                 }
    attribute(:number_of_students) { integer object['OgrenciSayisi']                  }
    attribute(:active)             { boolean object['Aktifmi'].eql?(1) ? true : false }
  end
end
