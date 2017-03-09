class Cohort < ApplicationRecord
  belongs_to :user
  has_many :students

  validates :user, :name, presence: true

  # accepts_nested_attributes_for :students

  def student_list

  end

  def student_list=(student_list)
    student_list.split("\n").each do |name|
      students.new(name: name.chomp)
    end
  end
end
