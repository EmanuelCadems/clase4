class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cargar_usuario

  def cargar_usuario
  	@user = User.new
  end
end
