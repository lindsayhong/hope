class ParticipantsController < ApplicationController
  before_filter :authenticate_user!, :find_participant, only: [:show, :edit, :update] #Requires that a User is signed in to view any Participant page.

  def new
  	@participant = Participant.new
  end

  def create
  	# participant_params
  	@participant = Participant.new(params.require(:participant).permit(:first_name, :last_name, :medical_record_number, :date_of_birth, :middle_initial))

  	if @participant.save
  		redirect_to @participant
  	else
  		render action: new
  	end
  end

  def index
  	@participants = Participant.all
  end

  def show
    @interventions = Intervention.where(participant_id: @participant.id)
    @hospital_visits = HospitalVisit.all
	end

  def edit
  end

  def update
  	@participant.update_attributes(params.require(:participant).permit(:first_name, :last_name, :medical_record_number, :date_of_birth, :middle_initial))
  	redirect_to @participant
  end

  private

  def find_participant
  	@participant = Participant.find(params[:id])
  end

  def participant_params
  end

end
