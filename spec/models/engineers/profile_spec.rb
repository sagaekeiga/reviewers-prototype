# == Schema Information
#
# Table name: engineers_profiles
#
#  id         :integer          not null, primary key
#  operation  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Engineers::Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
