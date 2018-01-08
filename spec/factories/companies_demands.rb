# == Schema Information
#
# Table name: companies_demands
#
#  id         :integer          not null, primary key
#  company_id :integer
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :companies_demand, class: 'Companies::Demand' do
    company nil
    note { Faker::Lorem.paragraph }
  end
end
