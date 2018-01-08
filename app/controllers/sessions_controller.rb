class SessionsController < ApplicationController

  def github
    @model = Company.find_for_oauth(request.env)
    if @model.persisted?
      sign_in @model, event: :authentication
      redirect_to root_url
    else
      session['devise.data'] = request.env['omniauth.auth']
      redirect_to new_company_registration_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
