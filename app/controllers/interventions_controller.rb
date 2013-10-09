class InterventionsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_participant, only: [:new, :create, :edit, :update, :show]
  before_filter :find_intervention, only: [:show, :edit, :update]
  before_filter :form_options, only: [:new, :edit]
  
  def new
    @intervention = Intervention.new

  end

  def create
  	@intervention = @participant.interventions.build(params.require(:intervention).permit(:group, :nurse, :intervention_start_date, :intervention_end_date, :previous_hospitalizations, :outcome, :participant_id))
  	
    if @intervention.save
  		redirect_to participant_intervention_path(@participant.id, @intervention)
  	else
  		render action: new
  	end
  end

  def index
  	@interventions = Intervention.all
  end

  def show
    @hospital_visits = HospitalVisit.where(intervention_id: @intervention.id)
    @er_visits = ErVisit.where(intervention_id: @intervention.id)
  end

  def edit
  end

  def update
    @participant = Participant.find(params[:participant_id])
    @intervention = Intervention.find(params[:id])
  	@intervention.update_attributes(params.require(:intervention).permit(:group, :nurse, :intervention_start_date, :intervention_end_date, :previous_hospitalizations, :outcome, :participant_id))
    redirect_to participant_intervention_path
  end

  private

  def find_participant
    @participant = Participant.find(params[:participant_id])
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
