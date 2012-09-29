#encoding=utf-8
class HomeController < ApplicationController
  def index
  end

  def configurar
  	@current_user = current_user
  end

  
  def actualizar_usuario
	  @current_user = current_user
	 
	  respond_to do |format|
	    if @current_user.update_attributes(params[:user])
	      format.html  { redirect_to(root_path,
	                    :notice => 'Datos de Envío Actualizados exitosamente.') }
	      format.json  { head :no_content }
	    else
	      format.html  { render :action => "edit" }
	      format.json  { render :json => @holiday.errors,
	                    :status => :unprocessable_entity }
	    end
	  end
  end
end
