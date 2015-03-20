class SitesController < ApplicationController
      before_filter :set_headers
      respond_to :html, :json
  skip_before_filter :verify_authenticity_token
  def index
    @sites = Site.all
    @jsvar = Rails.logger
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
    @site = Site.new(params.require(:site).permit(:name, :description))
    if @site.save
       flash[:notice] = "site was saved."
       redirect_to @site
     else
       flash[:error] = "There was an error saving your site. Please try again."
       render :new
     end

  end

  def edit
  end
  
    def set_headers
            headers['Access-Control-Allow-Origin'] = '*'
            headers['Access-Control-Expose-Headers'] = 'ETag'
            headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
            headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
            headers['Access-Control-Max-Age'] = '86400'
    end
  
  
end
