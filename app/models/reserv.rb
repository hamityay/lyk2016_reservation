class Reserv < ApplicationRecord
  validate :check_date
  validates :costumer_id, uniqueness: { scope: :place_id }


  belongs_to :place
  belongs_to :costumer

  def check_date
		if date.present? && date < Date.today
			errors.add(:established_at, "Couldn't be past")
		end
	end

end
