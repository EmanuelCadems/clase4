class HolidaysController < InheritedResources::Base
	before_filter :authenticate_user!

	# belongs_to :user
	# actions :index, :new, :create
	protected
	def begin_of_association_chain
		current_user
	end

	def collection
		#@holidays ||= end_of_association_chain.paginate(:page => params[:page])
		# @holidays ||= end_of_association_chain.paginate(:params[:page]).all
		get_collection_ivar || set_collection_ivar(end_of_association_chain.paginate(:page => params[:page], :per_page => per_page))
	end

	def per_page
		3
	end

	# def create
	# 	create!{colletion_url}
	# end

	# ApplicationController
	# def index
	# 	@holidays = current_user.holidays
	# end

	# def new 
	# 	@holiday = current_user.holidays.new
	# end

	# def edit
	# 	@holiday = Holiday.find(params[:id])
	# end

	# def create
	# 	@holiday = current_user.holidays.build(params[:holiday])
	# 	if @holiday.save
	# 		flash[:notice]= "Feriado registrado exitosamente."
	# 		redirect_to holidays_path
	# 	else
	# 		render :action => 'new'
	# 	end
	# end

	# def update
	#   @holiday = Holiday.find(params[:id])
	 
	#   respond_to do |format|
	#     if @holiday.update_attributes(params[:holiday])
	#       format.html  { redirect_to(holidays_path,
	#                     :notice => 'Feriado Actualizado exitosamente.') }
	#       format.json  { head :no_content }
	#     else
	#       format.html  { render :action => "edit" }
	#       format.json  { render :json => @holiday.errors,
	#                     :status => :unprocessable_entity }
	#     end
	#   end
	# end
end