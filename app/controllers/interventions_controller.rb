class InterventionsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_recruitment, only: [:new, :create, :edit, :update, :show]
  before_filter :find_intervention, only: [:show, :edit, :update]
  before_filter :form_options, only: [:new, :edit]
  
  def index
  	@interventions = Intervention.all
  end

  def summary
    
  end

  def new
    @intervention = Intervention.new
  end

  def create
    @intervention = @recruitment.interventions.build(params.require(:intervention).permit(:nurse, :intervention_start_date, :intervention_end_date, :outcome))
    
    if @intervention.save
      redirect_to recruitment_intervention_path(@recruitment, @intervention)
    else
      render action: new
    end
  end

  def show
    @recruit = Recruit.find(@recruitment.recruit_id)
    @hospital_visits = HospitalVisit.where(intervention_id: @intervention)
    @er_visits = ErVisit.where(intervention_id: @intervention)
  end

  def edit
  end

  def update
  	@intervention.update_attributes(params.require(:intervention).permit(:group, :nurse, :intervention_start_date, :intervention_end_date, :previous_hospitalizations, :outcome))
    redirect_to recruitment_intervention_path
  end

  private

  def find_recruitment
    @recruitment = Recruitment.find(params[:recruitment_id])
  end

  def find_intervention
    @intervention = Intervention.find(params[:id])
  end

  def form_options
  	@group_options = ["Hilo 30-Day", "Hilo 1-Year", "Honolulu 1-Year"]
  	@nurse_options = ["Crystal", "Berlyn", "Mary Ann", "Christine"]
  	@outcome_options = ["Currently enrolled", "Died", "Withdrew", "Completed"]
  end
end
