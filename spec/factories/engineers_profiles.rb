# == Schema Information
#
# Table name: engineers_profiles
#
#  id         :integer          not null, primary key
#  operation  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :engineers_profile, class: 'Engineers::Profile' do
    
  end
end
