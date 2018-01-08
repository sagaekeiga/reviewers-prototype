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

class Engineers::Profile < ApplicationRecord
  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  belongs_to :engineer

  # -------------------------------------------------------------------------------
  # Attributes
  # -------------------------------------------------------------------------------
  attribute :operation, default: false

  def cast_operation!
    if operation == true
      update(operation: false)
    else
      update(operation: true)
    end
  end
end
