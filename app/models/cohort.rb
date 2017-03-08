class Cohort < ApplicationRecord
  belongs_to :user
  has_many :students

  validates :user, :name, presence: true
end
