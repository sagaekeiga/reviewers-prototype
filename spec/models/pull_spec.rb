# == Schema Information
#
# Table name: pulls
#
#  id         :integer          not null, primary key
#  pull_id    :integer
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Pull, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
