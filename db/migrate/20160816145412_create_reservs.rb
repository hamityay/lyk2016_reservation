class CreateReservs < ActiveRecord::Migration[5.0]
  def change
    create_table :reservs do |t|
      t.references :costumer, foreign_key: true
      t.references :place, foreign_key: true
      t.date :date
      t.integer :number_of_p

      t.timestamps
    end
  end
end
