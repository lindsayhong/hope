class HospitalVisitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_intervention, only: [:new, :create, :edit, :update, :destroy, :show]
  before_filter :find_recruitment, only: [:edit, :update, :destroy]
  # after_save :calculate_duration

  def new
    @hospital_visit = HospitalVisit.new
  end

  def create
    @hospital_visit = @intervention.hospital_visits.build(params.require(:hospital_visit).permit(:admission_date, :discharge_date, :icd9_code, :icd9_detail, :cost))

    if @hospital_visit.save
      redirect_to recruitment_intervention_path(@intervention.recruitment_id, @intervention)
    else
        render action: new
    end
  end

  def destroy
    @hospital_visit = HospitalVisit.find(params[:id])
    @hospital_visit.destroy
    redirect_to recruitment_intervention_path(@intervention.recruitment_id, @intervention)
  end

  def edit
    @hospital_visit = HospitalVisit.find(params[:id])
  end

  def update
    @hospital_visit = HospitalVisit.find(params[:id])
    @hospital_visit.update_attributes(params.require(:hospital_visit).permit(:admission_date, :discharge_date, :icd9_code, :icd9_detail, :cost))
    redirect_to recruitment_intervention_path(@intervention.recruitment_id, @intervention)
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

  def find_recruitment
    @recruitment = Recruitment.find(@intervention.recruitment.id)
  end

  # def calculate_duration
  #   @hospital_visit = HospitalVisit.find(params[:id])
  #   write_attribute(:hospital_visit_duration, (@hospital_visit.discharge_date - @hospital_visit.admission_date).to_i)
  #   save
  # end
end
