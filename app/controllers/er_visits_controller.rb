class ErVisitsController < ApplicationController
  before_filter :find_intervention, only: [:new, :create, :show]
  def index
  end

  def show
    @er_visit = ErVisit.find(params[:id])
    @participant = Participant.find(@intervention.participant_id)
  end

  
  def new
    @er_visit = ErVisit.new

  end

  def create
    @er_visit = @intervention.er_visits.build(params.require(:er_visit).permit(:er_date, :er_icd9_code, :er_icd9_detail, :er_cost, :er_notes))
    
    if @er_visit.save
      redirect_to intervention_er_visit_path(@intervention.id, @er_visit)
    else
      render action: new
    end
  end

  def edit
  end

  private

  def find_intervention
    @intervention = Intervention.find(params[:intervention_id])
  end

end
