class EventsController < ApplicationController
    before_filter :set_headers
    respond_to :html, :json
   skip_before_filter :verify_authenticity_token
  def index
    #@events = 
  end

  def edit
  end

  def show
  end
  def new
    @site = Site.find(params[:site_id])
    @event = Event.new
 
  end
  def create
    Rails.logger.info "ARRIVED IN EventsController#Create !!!"
    Rails.logger.info params.inspect
    Rails.logger

            #@site = Site.first # .find(params[:site_identifier)
    @site= Site.find(params[:site_identifier])   
            #@site = Site.find(params[:site_identifier)
    Rails.logger.info params.keys
    @event = @site.events.build(params.require(:event).permit(:name, :property_1, :property_2 ))
    #@event = @site.events.build( name: params[:name], property_1: params[:property_1], proterty_2: params[:property2])
    if @event.save
      render nothing: true, status: 200
      
    else
      render nothing: true, status: 500      
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
