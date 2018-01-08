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

require 'rails_helper'

RSpec.describe Companies::Identity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
