module RecruitsHelper
	def current_age(date_of_birth)
		if @current_date.month <= date_of_birth.try(:month) && @current_date.day < date_of_birth.day
			@current_age = @current_date.year - date_of_birth.year - 1
		else
			@current_age = @current_date.year - date_of_birth.year
		end
	end
end
