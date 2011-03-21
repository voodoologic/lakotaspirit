class BrowseController < ApplicationController
before_filter :initialize_cart
  def index
      @items = Item.search(params[:search], params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end
  
  def show
  		@item = Item.find_by_id(params[:id])
  	end
  	def category
  		@items = Item.find_all_by_category(params[:category]).paginate( :page => params[:page], :per_page => 6)
  	end
end
