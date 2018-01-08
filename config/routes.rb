# == Route Map
#
#                       Prefix Verb   URI Pattern                           Controller#Action
#                         root GET    /                                     welcome#index
#                       logout GET    /logout(.:format)                     sessions#destroy
#         new_engineer_session GET    /engineers/sign_in(.:format)          engineers/sessions#new
#             engineer_session POST   /engineers/sign_in(.:format)          engineers/sessions#create
#     destroy_engineer_session DELETE /engineers/sign_out(.:format)         engineers/sessions#destroy
#        new_engineer_password GET    /engineers/password/new(.:format)     engineers/passwords#new
#       edit_engineer_password GET    /engineers/password/edit(.:format)    engineers/passwords#edit
#            engineer_password PATCH  /engineers/password(.:format)         engineers/passwords#update
#                              PUT    /engineers/password(.:format)         engineers/passwords#update
#                              POST   /engineers/password(.:format)         engineers/passwords#create
# cancel_engineer_registration GET    /engineers/cancel(.:format)           engineers/registrations#cancel
#    new_engineer_registration GET    /engineers/sign_up(.:format)          engineers/registrations#new
#   edit_engineer_registration GET    /engineers/edit(.:format)             engineers/registrations#edit
#        engineer_registration PATCH  /engineers(.:format)                  engineers/registrations#update
#                              PUT    /engineers(.:format)                  engineers/registrations#update
#                              DELETE /engineers(.:format)                  engineers/registrations#destroy
#                              POST   /engineers(.:format)                  engineers/registrations#create
#          new_company_session GET    /companies/sign_in(.:format)          companies/sessions#new
#              company_session POST   /companies/sign_in(.:format)          companies/sessions#create
#      destroy_company_session DELETE /companies/sign_out(.:format)         companies/sessions#destroy
#         new_company_password GET    /companies/password/new(.:format)     companies/passwords#new
#        edit_company_password GET    /companies/password/edit(.:format)    companies/passwords#edit
#             company_password PATCH  /companies/password(.:format)         companies/passwords#update
#                              PUT    /companies/password(.:format)         companies/passwords#update
#                              POST   /companies/password(.:format)         companies/passwords#create
#  cancel_company_registration GET    /companies/cancel(.:format)           companies/registrations#cancel
#     new_company_registration GET    /companies/sign_up(.:format)          companies/registrations#new
#    edit_company_registration GET    /companies/edit(.:format)             companies/registrations#edit
#         company_registration PATCH  /companies(.:format)                  companies/registrations#update
#                              PUT    /companies(.:format)                  companies/registrations#update
#                              DELETE /companies(.:format)                  companies/registrations#destroy
#                              POST   /companies(.:format)                  companies/registrations#create
#         auth_github_callback GET    /auth/github/callback(.:format)       sessions#github
#                              POST   /auth/:action/callback(.:format)      sessions#:action
#         edit_engineers_skill GET    /engineers/skills/:id/edit(.:format)  engineers/skills#edit
#              engineers_skill PATCH  /engineers/skills/:id(.:format)       engineers/skills#update
#                              PUT    /engineers/skills/:id(.:format)       engineers/skills#update
#         engineers_operations POST   /engineers/operations(.:format)       engineers/operations#create
#        engineers_pullrequest GET    /engineers/pullrequests/:id(.:format) engineers/pullrequests#show
#        edit_companies_demand GET    /companies/demands/:id/edit(.:format) companies/demands#edit
#             companies_demand PATCH  /companies/demands/:id(.:format)      companies/demands#update
#                              PUT    /companies/demands/:id(.:format)      companies/demands#update
#       companies_pullrequests POST   /companies/pullrequests(.:format)     companies/pullrequests#create
#    new_companies_pullrequest GET    /companies/pullrequests/new(.:format) companies/pullrequests#new
#        companies_pullrequest GET    /companies/pullrequests/:id(.:format) companies/pullrequests#show
# 

Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/logout', to: 'sessions#destroy'

  #
  # Devise
  #
  devise_for :engineers, controllers: {
    sessions:      'engineers/sessions',
    passwords:     'engineers/passwords',
    registrations: 'engineers/registrations'
  }
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }

  #
  # Omniauth
  #
  get '/auth/github/callback', to: 'sessions#github'
  devise_scope :company do
    post '/auth/:action/callback',
      controller: 'sessions',
      constraints: { action: /github/ }
  end

  #
  # Engineer
  #
  namespace :engineers do
    resources :skills, only: %i(edit update)
    resources :operations, only: %i(create)
    resources :pullrequests, only: %i(show)
  end

  #
  # Company
  #
  namespace :companies do
    resources :demands, only: %i(edit update)
    resources :pullrequests, only: %i(new create show)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
