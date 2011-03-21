class ViewerController < ApplicationController

 def show
	@page = Page.find_by_name(params[:name])  
	require_user(4) if @page.admin?
  end
end
