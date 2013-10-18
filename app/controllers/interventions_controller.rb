class InterventionsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_recruit, only: [:new, :create, :edit, :update, :show]
  before_filter :find_intervention, only: [:show, :edit, :update]
  before_filter :form_options, only: [:new, :edit]
  
  def index
  	@interventions = Intervention.all
  end

  def summary
    @hilo_30_interventions = Intervention.where(group: "Hilo 30-Day")
    @hilo_1_year_interventions = Intervention.where(group: "Hilo 1-Year")
    @hnl_1_year_interventions = Intervention.where(group: "Honolulu 1-Year")
    @hospital_visits = HospitalVisit.all
    @er_visits = ErVisit.all
  end

  def new
    @intervention = Intervention.new
  end

  def create
    @intervention = @recruit.interventions.build(params.require(:intervention).permit(:group, :nurse, :intervention_start_date, :intervention_end_date, :previous_hospitalizations, :outcome, :recruit_id))
    
    if @intervention.save
      redirect_to recruit_intervention_path(@recruit, @intervention)
    else
      render action: new
    end
  end


  def show
    @hospital_visits = HospitalVisit.where(intervention_id: @intervention.id)
    @er_visits = ErVisit.where(intervention_id: @intervention.id)
  end

  def edit
  end

  def update
    @intervention = Intervention.find(params[:id])
  	@intervention.update_attributes(params.require(:intervention).permit(:group, :nurse, :intervention_start_date, :intervention_end_date, :previous_hospitalizations, :outcome, :recruit_id))
    redirect_to recruit_intervention_path
  end

  private

  def find_recruit
    @recruit = Recruit.find(params[:recruit_id])
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
