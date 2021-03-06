class Group < ApplicationRecord
	validates :group_name, uniqueness: true, presence: true
	has_many :users, through: :group_users
	has_many :group_users
	has_many :messages
end
