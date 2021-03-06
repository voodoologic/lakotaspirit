class UsersController < ApplicationController
before_filter do |controller|
		controller.require_user(4)
	end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration succesful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
    def index
    #if then statement based on authorization_check
    if authorization_level(4)
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
    elsif authorization_level(3)
    @user = User.find_all_by_id(@current_user.id)
    else 
    	flash[:notice] = "You do not have privilages to access that page,bitch"
		redirect_to root_url
	 end
  end
  def edit
    @user = User.find(params[:id])
  end
  
  def show
  	@user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
