class Student < ApplicationRecord
	#serialize :sport, Array

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


	def can_play
		self.concussion && self.cardiac && self.c_o_ethics && self.physical && self.doctor_note
	end
end
