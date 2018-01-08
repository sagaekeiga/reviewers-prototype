# == Schema Information
#
# Table name: pullrequests
#
#  id                  :integer          not null, primary key
#  company_id          :integer
#  pull_request_id     :integer
#  title               :string
#  url                 :string
#  html_url            :string
#  diff_url            :string
#  patch_url           :string
#  issue_url           :string
#  commits_url         :string
#  review_comments_url :string
#  review_comment_url  :string
#  comments_url        :string
#  statuses_url        :string
#  number              :string
#  state               :string
#  body                :string
#  events_url          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Pullrequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
