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

FactoryBot.define do
  factory :companies_identity, class: 'Companies::Identity' do
    
  end
end
