class ChangeDateToDatetimeOnReservs < ActiveRecord::Migration[5.0]
  def change
    change_column :reservs, :date, :datetime
  end
end
