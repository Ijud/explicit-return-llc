class Cohort < ApplicationRecord
  belongs_to :user
  has_many :students

  validates :user, :name, presence: true

  accepts_nested_attributes_for :students

  def student_data

  end

  def student_data=(data)
    # @students =
  end
end
