# == Schema Information
#
# Table name: engineers_profiles
#
#  id          :integer          not null, primary key
#  engineer_id :integer
#  operation   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :engineers_profile, class: 'Engineers::Profile' do
    engineer nil
    operation false
  end
end
