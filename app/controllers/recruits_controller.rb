class RecruitsController < ApplicationController
  before_filter :authenticate_user!, :find_recruit, only: [:show, :edit, :update] #Requires that a User is signed in to view any Participant page.

  before_filter :sex_options, only: [:new, :edit]

  def new
  	@recruit = Recruit.new
  end

  def create
  	@recruit = Recruit.new(params.require(:recruit).permit(:first_name, :last_name, :medical_record_number, :date_of_birth, :middle_initial, :sex))

  	if @recruit.save
  		redirect_to @recruit
  	else
  		render action: new
  	end
  end

  def index
  	@recruits = Recruit.all
  end

  def show
    @recruitments = Recruitment.where(recruit_id: @recruit.id)
    @interventions = Intervention.where(recruit_id: @recruit.id)
    @current_date = Date.today
    @hospital_visits = HospitalVisit.all
    @er_visits = ErVisit.all
	end

  def edit
  end

  def update
  	@recruit.update_attributes(params.require(:recruit).permit(:first_name, :last_name, :medical_record_number, :date_of_birth, :middle_initial, :sex))
  	redirect_to @recruit
  end

  private

  def find_recruit
  	@recruit = Recruit.find(params[:id])
  end

  def recruit_params
  end

  def sex_options
    @sex_options = ["Male", "Female"]
  end

end
