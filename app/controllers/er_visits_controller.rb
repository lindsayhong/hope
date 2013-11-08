class ErVisitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_intervention, only: [:new, :create, :edit, :update, :show]
  before_filter :find_recruitment, only: [:new, :create, :edit, :update, :show]
  before_filter :find_recruit, only: [:new, :create, :edit, :update, :show]
  
  def index
  end

  def show
    @er_visit = ErVisit.find(params[:id])
    @recruit = Recruit.find(@intervention.recruitment_id)
  end
  
  def new
    @er_visit = ErVisit.new
  end

  def create
    @er_visit = @intervention.er_visits.build(params.require(:er_visit).permit(:er_date, :er_icd9_code, :er_icd9_detail, :er_cost, :er_notes))
    
    if @er_visit.save
      redirect_to recruitment_intervention_path(@intervention.recruitment_id, @intervention)
    else
      render action: new
    end
  end

  def edit
    @er_visit = ErVisit.find(params[:id])
  end

  def update
    @er_visit = ErVisit.find(params[:id])
    @er_visit.update_attributes(params.require(:er_visit).permit(:er_date, :er_icd9_code, :er_icd9_detail, :er_cost, :er_notes))
    redirect_to recruitment_intervention_path(@intervention.recruitment_id, @intervention)
  end

  private

  def find_intervention
    @intervention = Intervention.find(params[:intervention_id])
  end

  def find_recruitment
    @recruitment = Recruitment.find(@intervention.recruitment_id)
  end

  def find_recruit
    @recruit = Recruit.find(@recruitment.recruit_id)
  end

end
