class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, limit: 15
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
