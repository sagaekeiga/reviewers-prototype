class Companies::DemandsController < ApplicationController

  def edit
  end

  def update
    respond_to do |format|
      if current_company.update(demand_params)
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: current_company }
      else
        format.html { render :new }
        format.json { render json: current_company.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def demand_params
    params.require(:company).permit(
      demand_attributes: %i(
        id
        note
      )
    )
  end
end
