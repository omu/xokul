class CreateAcademicians < ActiveRecord::Migration[5.2]
  def change
    create_table :academicians do |t|
      t.string :tc_kimlik_no
      t.string :adi
      t.string :soyadi
      t.string :kadro_unvan
      t.integer :birim_id

      t.timestamps
    end
  end
end
