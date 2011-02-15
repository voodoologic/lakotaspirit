class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  uses_tiny_mce(:options => {:theme => 'advanced',
  :browsers => %w{msie gecko},
  :theme_advanced_toolbar_location => "top",
  :theme_advanced_toolbar_align => "left",
  :theme_advanced_resizing => true,
  :theme_advanced_resize_horizontal => false,
  :paste_auto_cleanup_on_paste => true,
  :theme_advanced_buttons1 => %w{formatselect fontselect fontsizeselect bold italic underline strikethrough separator justifyleft justifycenter justifyright indent outdent separator bullist numlist forecolor backcolor separator link unlink image undo redo},
  :theme_advanced_buttons2 => [],
  :theme_advanced_buttons3 => [],
  :plugins => %w{contextmenu paste}},
  :only => [:new, :edit, :show, :index])

  before_filter do |controller|
  	controller.require_user(4)
  end  
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
end
