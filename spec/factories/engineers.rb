# == Schema Information
#
# Table name: engineers
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

FactoryBot.define do
  factory :engineer do
    sequence(:email) { |n| "engineer#{n}@example.com" }
    password 'hogehoge'
    password_confirmation 'hogehoge'

    # スキル
    after(:create) do |engineer|
      engineer.skill_list.add('rails', 'ruby', 'java')
      engineer.save
    end
  end
end
