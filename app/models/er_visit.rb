class ErVisit < ActiveRecord::Base
  belongs_to :participant
  belongs_to :intervention
end