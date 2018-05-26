class Student < ApplicationRecord
	#serialize :sport, Array
	belongs_to :year

	has_one_attached :form
	validates :school_year, presence: true

# 	default_scope {sort_by(&:sport)}

	def order_by_year(desc = false)
		des = ""
		if desc
			des = "DESC"
		end
		Student.order("school_year #{des}")
	end

	def self.order_sport
		Student.order("sport")
	end

	def get_sport 
		self.sport.sort().join(" ")
	end

	def up_year
		self.school_year += 1
		self.save
	end

	def self.up_all_years
		Year.create
		Student.all.each do |student|
			student.up_year
		end

	end


	def can_play
		self.concussion && self.cardiac && self.c_o_ethics && self.physical && self.doctor_note
	end
end
