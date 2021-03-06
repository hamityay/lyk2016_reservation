class Place < ApplicationRecord
	validates :name, presence: true
	validates :adress, length: { maximum: 50 }
	validates :phone_number, length: { minimum: 10 }, uniqueness: true
	validates :contact_mail, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "not an e-mail adress" }, uniqueness: true
	validate :check_established_at

	has_many :comments, dependent: :destroy
	has_many :reservs, dependent: :destroy
	has_many :costumers, through: :reservs
	has_and_belongs_to_many :foods
	has_one :social_profile

	belongs_to :category
	belongs_to :owner

	accepts_nested_attributes_for :social_profile

	def check_established_at
		if established_at.present? && established_at > Date.today
			errors.add(:established_at, "Couldn't be feature")
		end
	end

	# def category
	# 	Category.find(category_id)
	# end
end
