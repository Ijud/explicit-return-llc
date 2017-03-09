class GroupingsController < ApplicationController

  def create
    @cohort = Cohort.find(params[:cohort_id])
    group_up(@cohort.students, params[:groupings][:size].to_i).each_with_index do |group, index|
      group.each do |student|
        @cohort.groupings.new(group_id: index, student: student)
      end
    end

    if @cohort.save
      # redirect_to
    else
      redirect_to @cohort
    end
  end

  def group_up(students, size)
    number_of_groups = students.length / size
    remainder = students.length % size

    students = students.shuffle

    groups = Array.new(number_of_groups) do
      Array.new(size) { students.shift }
    end

    remainder.times do |i|
      groups[i] << students.shift
    end

    p groups
  end

end
