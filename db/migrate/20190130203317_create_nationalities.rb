class CreateNationalities < ActiveRecord::Migration[5.2]
  def change
    create_table :nationalities do |t|
      t.integer :kod
      t.string :ad

      t.timestamps
    end
  end
end
