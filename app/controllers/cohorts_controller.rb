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
    if @cohort.save
      redirect_to @cohort
    else
      render :new
    end
  end

  private
    def cohort_params
      params.require(:cohort).permit(:name, :student_list)
    end
end
