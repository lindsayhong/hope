class RecruitmentsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_recruits, only: [:new, :create, :edit, :update, :show]
  before_filter :find_recruitment, only: [:show, :edit, :update]
  before_filter :form_options, only: [:new, :edit]
  
  def index
  	@recruitments = Recruitment.all
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = @recruit.recruitments.build(params.require(:recruitment).permit(:recruit_id, :review_date, :account_number, :admission_date, :past_er_visits, :past_hosp_visits, :reason_admitted, :age, :eject_frac, :serum_albumin, :group))
    
    if @recruitment.save
      redirect_to recruit_recruitment_path(@recruit.id, @recruitment)
    else
      render action: new
    end
  end


  def show
    @intervention = Intervention.where(recruitment_id: @recruitment_id).first
  end

  def edit
  end

  def update
  	@recruitment.update_attributes(params.require(:recruitment).permit(:recruit_id, :review_date, :account_number, :admission_date, :past_er_visits, :past_hosp_visits, :reason_admitted, :age, :eject_frac, :serum_albumin, :group))
    redirect_to recruit_recruitment_path
  end

  private

  def find_recruits
    @recruit = Recruit.find(params[:recruit_id])
  end
  
  def find_recruitment
  	@recruitment = Recruitment.find(params[:id])
  end

  def form_options
  	@group_options = ["Hilo 30-Day", "Hilo 1-Year", "Honolulu 1-Year"]
  	@nurse_options = ["Crystal", "Berlyn", "Mary Ann", "Christine"]
  	@outcome_options = ["Currently enrolled", "Died", "Withdrew", "Completed"]
  end
end
