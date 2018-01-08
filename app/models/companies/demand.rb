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

class Companies::Demand < ApplicationRecord
  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  belongs_to :company
end
