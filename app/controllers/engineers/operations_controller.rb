class Engineers::OperationsController < ApplicationController

  def create
    current_engineer.profile.cast_operation!
    redirect_to root_url
  end
end
