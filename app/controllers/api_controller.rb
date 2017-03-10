class ApiController < ApplicationController

def index

	@cohort = Cohort.find_by(uuid: params[:uuid])
	#@groupings = Grouping.find(params[:uuid])
	#@cohort.groupings
	
	info = @cohort.to_json(include: { groupings: { include: :student } })
	#message = {blah: :blah}
	render :json => info
end
end


#cohort_as_json['groupings'].first
#cohort_as_json = @cohort.as_json(include: :groupings)
#@cohort.cache_key