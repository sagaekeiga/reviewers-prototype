# == Route Map
#
#                       Prefix Verb   URI Pattern                          Controller#Action
#             engineers_skills GET    /engineers/skills(.:format)          engineers/skills#index
#                              POST   /engineers/skills(.:format)          engineers/skills#create
#          new_engineers_skill GET    /engineers/skills/new(.:format)      engineers/skills#new
#         edit_engineers_skill GET    /engineers/skills/:id/edit(.:format) engineers/skills#edit
#              engineers_skill GET    /engineers/skills/:id(.:format)      engineers/skills#show
#                              PATCH  /engineers/skills/:id(.:format)      engineers/skills#update
#                              PUT    /engineers/skills/:id(.:format)      engineers/skills#update
#                              DELETE /engineers/skills/:id(.:format)      engineers/skills#destroy
#         new_engineer_session GET    /engineers/sign_in(.:format)         devise/sessions#new
#             engineer_session POST   /engineers/sign_in(.:format)         devise/sessions#create
#     destroy_engineer_session DELETE /engineers/sign_out(.:format)        devise/sessions#destroy
#        new_engineer_password GET    /engineers/password/new(.:format)    devise/passwords#new
#       edit_engineer_password GET    /engineers/password/edit(.:format)   devise/passwords#edit
#            engineer_password PATCH  /engineers/password(.:format)        devise/passwords#update
#                              PUT    /engineers/password(.:format)        devise/passwords#update
#                              POST   /engineers/password(.:format)        devise/passwords#create
# cancel_engineer_registration GET    /engineers/cancel(.:format)          devise/registrations#cancel
#    new_engineer_registration GET    /engineers/sign_up(.:format)         devise/registrations#new
#   edit_engineer_registration GET    /engineers/edit(.:format)            devise/registrations#edit
#        engineer_registration PATCH  /engineers(.:format)                 devise/registrations#update
#                              PUT    /engineers(.:format)                 devise/registrations#update
#                              DELETE /engineers(.:format)                 devise/registrations#destroy
#                              POST   /engineers(.:format)                 devise/registrations#create
#          new_company_session GET    /companies/sign_in(.:format)         devise/sessions#new
#              company_session POST   /companies/sign_in(.:format)         devise/sessions#create
#      destroy_company_session DELETE /companies/sign_out(.:format)        devise/sessions#destroy
#         new_company_password GET    /companies/password/new(.:format)    devise/passwords#new
#        edit_company_password GET    /companies/password/edit(.:format)   devise/passwords#edit
#             company_password PATCH  /companies/password(.:format)        devise/passwords#update
#                              PUT    /companies/password(.:format)        devise/passwords#update
#                              POST   /companies/password(.:format)        devise/passwords#create
#  cancel_company_registration GET    /companies/cancel(.:format)          devise/registrations#cancel
#     new_company_registration GET    /companies/sign_up(.:format)         devise/registrations#new
#    edit_company_registration GET    /companies/edit(.:format)            devise/registrations#edit
#         company_registration PATCH  /companies(.:format)                 devise/registrations#update
#                              PUT    /companies(.:format)                 devise/registrations#update
#                              DELETE /companies(.:format)                 devise/registrations#destroy
#                              POST   /companies(.:format)                 devise/registrations#create
#                         root GET    /                                    welcome#index
#

Rails.application.routes.draw do
  namespace :engineers do
    resources :skills, only: %i(edit update)
  end

  devise_for :engineers
  devise_for :companies
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
