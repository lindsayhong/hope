module InterventionsHelper
	def find_recruit_recruitment(recruitment_id)
		Recruitment.find(recruitment_id)
	end
end
