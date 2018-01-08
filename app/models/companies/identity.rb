# == Schema Information
#
# Table name: companies_identities
#
#  id         :integer          not null, primary key
#  company_id :integer
#  provider   :string
#  uid        :string
#  token      :string
#  email      :string
#  name       :string
#  image      :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Companies::Identity < ApplicationRecord

  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  belongs_to :company

  # --------------------------------------------------------------------------------
  # Validations
  # --------------------------------------------------------------------------------
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

  def self.find_for_oauth(auth)
    identity = find_or_initialize_by(
      uid: auth['uid'],
      provider: auth['provider'],
      email: auth['email'],
      name: auth['info']['name'],
      image: auth['info']['image']
    )
    identity
  end
end
