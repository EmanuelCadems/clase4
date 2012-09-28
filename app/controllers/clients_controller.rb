class ClientsController < InheritedResources::Base
	before_filter :authenticate_user!
	def begin_of_association_chain
		current_user
	end
	def collection
		get_collection_ivar || set_collection_ivar(end_of_association_chain.paginate(:page => params[:page], :per_page => per_page))
	end

	def per_page
		3
	end

end
