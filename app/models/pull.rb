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

class Pull < ApplicationRecord
end
