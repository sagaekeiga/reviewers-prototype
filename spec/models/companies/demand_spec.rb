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

require 'rails_helper'

RSpec.describe Companies::Demand, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
