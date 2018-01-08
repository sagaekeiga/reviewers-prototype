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

FactoryBot.define do
  factory :company do
    sequence(:email) { |n| "company#{n}@example.com" }
    password 'hogehoge'
    password_confirmation 'hogehoge'

    trait :with_companies_demand do
      after(:create) do |company|
        create(:companies_demand, company: company)
      end
    end

    after(:create) do |company|
      company.pullrequests.create([
        { url: 'https://github.com/octokit/octokit.rb/pull/973' },
        { url: 'https://github.com/octokit/octokit.rb/pull/970' },
        { url: 'https://github.com/octokit/octokit.rb/pull/961' },
        { url: 'https://github.com/octokit/octokit.rb/pull/959' },
        { url: 'https://github.com/octokit/octokit.rb/pull/941' },
        { url: 'https://github.com/octokit/octokit.rb/pull/890' },
        { url: 'https://github.com/plataformatec/devise/pull/4733' },
        { url: 'https://github.com/plataformatec/devise/pull/4712' },
        { url: 'https://github.com/plataformatec/devise/pull/4711' },
        { url: 'https://github.com/plataformatec/devise/pull/4705' },
        { url: 'https://github.com/plataformatec/devise/pull/4700' }
      ])
    end
  end
end
