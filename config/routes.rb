# == Route Map
#
#                       Prefix Verb   URI Pattern                          Controller#Action
#                         root GET    /                                    welcome#index
#                       logout GET    /logout(.:format)                    sessions#destroy
#         new_engineer_session GET    /engineers/sign_in(.:format)         admins/sessions#new
#             engineer_session POST   /engineers/sign_in(.:format)         admins/sessions#create
#     destroy_engineer_session DELETE /engineers/sign_out(.:format)        admins/sessions#destroy
#        new_engineer_password GET    /engineers/password/new(.:format)    admins/passwords#new
#       edit_engineer_password GET    /engineers/password/edit(.:format)   admins/passwords#edit
#            engineer_password PATCH  /engineers/password(.:format)        admins/passwords#update
#                              PUT    /engineers/password(.:format)        admins/passwords#update
#                              POST   /engineers/password(.:format)        admins/passwords#create
# cancel_engineer_registration GET    /engineers/cancel(.:format)          admins/registrations#cancel
#    new_engineer_registration GET    /engineers/sign_up(.:format)         admins/registrations#new
#   edit_engineer_registration GET    /engineers/edit(.:format)            admins/registrations#edit
#        engineer_registration PATCH  /engineers(.:format)                 admins/registrations#update
#                              PUT    /engineers(.:format)                 admins/registrations#update
#                              DELETE /engineers(.:format)                 admins/registrations#destroy
#                              POST   /engineers(.:format)                 admins/registrations#create
#          new_company_session GET    /companies/sign_in(.:format)         users/sessions#new
#              company_session POST   /companies/sign_in(.:format)         users/sessions#create
#      destroy_company_session DELETE /companies/sign_out(.:format)        users/sessions#destroy
#         new_company_password GET    /companies/password/new(.:format)    users/passwords#new
#        edit_company_password GET    /companies/password/edit(.:format)   users/passwords#edit
#             company_password PATCH  /companies/password(.:format)        users/passwords#update
#                              PUT    /companies/password(.:format)        users/passwords#update
#                              POST   /companies/password(.:format)        users/passwords#create
#  cancel_company_registration GET    /companies/cancel(.:format)          users/registrations#cancel
#     new_company_registration GET    /companies/sign_up(.:format)         users/registrations#new
#    edit_company_registration GET    /companies/edit(.:format)            users/registrations#edit
#         company_registration PATCH  /companies(.:format)                 users/registrations#update
#                              PUT    /companies(.:format)                 users/registrations#update
#                              DELETE /companies(.:format)                 users/registrations#destroy
#                              POST   /companies(.:format)                 users/registrations#create
#         auth_github_callback GET    /auth/github/callback(.:format)      sessions#github
#                              POST   /auth/:action/callback(.:format)     sessions#:action
#         edit_engineers_skill GET    /engineers/skills/:id/edit(.:format) engineers/skills#edit
#              engineers_skill PATCH  /engineers/skills/:id(.:format)      engineers/skills#update
#                              PUT    /engineers/skills/:id(.:format)      engineers/skills#update
#         engineers_operations POST   /engineers/operations(.:format)      engineers/operations#create
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
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
