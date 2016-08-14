class Place < ApplicationRecord
	validates :name, presence: true
	validates :adress, length: { maximum: 50 }
	validates :phone_number, length: { minimum: 10 }, uniqueness: true
	validates :contact_mail, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "not an e-mail adress" }, uniqueness: true
	validate :check_established_at

	def check_established_at
		if established_at.present? && established_at < Date.today
			errors.add(:established_at, "Cannot be past")
		end
	end

	belongs_to :category
	# def category
	# 	Category.find(category_id)
	# end
end
