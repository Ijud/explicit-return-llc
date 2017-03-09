class CohortsController < ApplicationController
  def new
    @cohort = Cohort.new
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.user = User.first

    params[:student_data][:students].split("\n").each do |name|
      @cohort.students.new(name: name.gsub(/\s/, ''))
    end

    if @cohort.save
      redirect_to @cohort
    else
      render :new
    end
  end

  def index
    @cohort = Cohort.all
  end

  private
    def cohort_params
      params.require(:cohort).permit(:name)
    end
end
