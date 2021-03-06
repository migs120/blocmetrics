class SitesController < ApplicationController
      before_filter :set_headers
      respond_to :html, :json, :js
  skip_before_filter :verify_authenticity_token
  def index
        unless current_user
          flash[:notice] = "Must sign in or sign up to use service!!"
          redirect_to root_path
        end
    
        if current_user   
            @sites = current_user.sites.all
            @adminsites = Site.all
            @jsvar = Rails.logger
        end
  end

  def show
    @site = Site.find(params[:id])
    @events = @site.events
    
    
                @any = Rails.logger.methods
                @any2 = Rails.logger.inspect
  end

  def new
    @site = Site.new
  end
  def create
   # @site = Site.new(params.require(:site).permit(:name, :description))
    @site = current_user.sites.new(params.require(:site).permit(:name, :description))
    if @site.save
       flash[:notice] = "site was saved."
       redirect_to @site
     else
       flash[:error] = "There was an error saving your site. Please try again."
       render :new
     end

  end

  def edit
    @site = Site.find(params[:id])
  end
  
  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params.require(:site).permit(:name, :description))
      flash[:notice] = "Site was updated."
      redirect_to @site
     else
      flash[:error] = "There was an error saving the site. Please try again."
       render :edit
     end

  end
  
  def destroy
    @site = Site.find(params[:id])
    name = @site.name
 
    
    if @site.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to sites_path
     else
      flash[:error] = "There was an error deleting the site."
       render :show
     end

  end
  
    def set_headers
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Expose-Headers'] = 'ETag'
            headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
            headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
            headers['Access-Control-Max-Age'] = '86400'
    end
  
  
end
