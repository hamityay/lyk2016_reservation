class AddCostumerToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :costumer, foreign_key: true
  end
end
