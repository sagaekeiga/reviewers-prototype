class Engineers::SkillsController < ApplicationController
  before_action :set_engineer, only: %i(edit update)
  def index
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @engineer.update(engineer_skill_params.merge(email: current_engineer.email))
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @engineer }
      else
        format.html { render :new }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def engineer_skill_params
    params.require(:engineer).permit(:skill_list)
  end

  def set_engineer
    @engineer = Engineer.find(params[:id])
  end
end
