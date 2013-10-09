class HospitalVisitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_intervention, only: [:new, :create, :edit, :update, :show]

  def new
    @hospital_visit = HospitalVisit.new
  end

  def create
    @hospital_visit = @intervention.hospital_visits.build(params.require(:hospital_visit).permit(:admission_date, :discharge_date, :icd9_code, :icd9_detail, :cost))

    if @hospital_visit.save
      redirect_to intervention_hospital_visit_path(@intervention.id, @hospital_visit)
    else
        render action: new
    end
  end

  def edit
    @hospital_visit = HospitalVisit.find(params[:id])
  end

  def update
    @hospital_visit = HospitalVisit.find(params[:id])
    @hospital_visit.update_attributes(params.require(:hospital_visit).permit(:admission_date, :discharge_date, :icd9_code, :icd9_detail, :cost))
    redirect_to participant_intervention_path(@intervention.participant_id, @intervention)
  end

  def show
    @hospital_visit = HospitalVisit.find(params[:id])
  end

  def index
  end

  private

  def find_intervention
    @intervention = Intervention.find(params[:intervention_id])
  end
end
