class School < ApplicationRecord
	has_many :years
	belongs_to :user
end
