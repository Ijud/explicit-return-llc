class Grouping < ApplicationRecord
  belongs_to :cohort
  belongs_to :student

  validates :cohort, :student, :group_id, :grouping_id, null: false

  # validates :student, uniqueness: { scope: :grouping_id }
end
