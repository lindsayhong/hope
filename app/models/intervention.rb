class Intervention < ActiveRecord::Base
	has_many :hospital_visits
  has_many :er_visits
  belongs_to :recruitment
end
