class EventsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end
  def create
    Rails.logger.info "ARRIVED IN EventsController#Creat !!!"
    Rails.logger.info params.inspect
    render status: 200
  end
end
