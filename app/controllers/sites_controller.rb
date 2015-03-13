class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
