class Cohort < ApplicationRecord
  belongs_to :user
  has_many :students
  has_many :groupings

  validates :user, :name, presence: true

end
