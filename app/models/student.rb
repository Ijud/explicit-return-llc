class Student < ApplicationRecord
  belongs_to :cohort
  has_many :groupings

  validates :cohort, :name, presence: true
end
