# == Schema Information
#
# Table name: companies
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  has_one :identity, class_name: 'Companies::Identity'

  def self.find_for_oauth(env)
    auth   = env['omniauth.auth']
    origin = env['omniauth.origin']
    identity = Companies::Identity.find_for_oauth(auth)
    email = auth.info.email

    company = identity.company
    if company.nil?
      company =  Company.new(
        email:    email,
        password: Devise.friendly_token[0, 20]
      )
      # company.skip_confirmation!
      company.save!
    end

    if identity.company != company
      identity.company = company
      identity.save!
    end

    company
  end
end
