class GroupingsController < ApplicationController

  def show

  end

  def create
    @cohort = Cohort.find(params[:cohort_id])

    grouping_id = @cohort.groupings.select(:grouping_id).group(:grouping_id).count.size
    group_up(@cohort.students, params[:groupings][:size].to_i).each_with_index do |group, index|
      group.each do |student|
        @cohort.groupings.new(grouping_id: grouping_id, group_id: index, student: student)
      end
    end

    @cohort.save
    redirect_to @cohort
  end

  def group_up(students, size)
    number_of_groups = students.length / size
    remainder = students.length % size

    students = students.shuffle

    groups = Array.new(number_of_groups) do
      Array.new(size) { students.shift }
    end

    if remainder > number_of_groups
      groups << Array.new(remainder) { students.shift }
    else
      remainder.times do |i|
        groups[i] << students.shift
      end
    end

    groups
  end

  def destroy
    @grouping = Grouping.find(params[:id])
    @cohort = @grouping.cohort
    @grouping.destroy
    redirect_to cohort_path(@cohort)
  end

  # private
  #   def grouping_params
  #     params.require(:grouping).permit(:grouping_id, :cohort_id, :group_id, :student_id)
  #   end

end
