class Grouping < ApplicationRecord
  belongs_to :cohort
  belongs_to :student

  validates :cohort, :student, :group_id, null: false
end
