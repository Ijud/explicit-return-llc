class Student < ApplicationRecord
  belongs_to :cohort

  validates :cohort, :name, presence: true
end
