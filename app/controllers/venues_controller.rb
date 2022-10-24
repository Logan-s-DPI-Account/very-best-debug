class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/index.html.erb" })
  end

  def show
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id }).at(0)
    @the_venue = matching_venues

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    redirect_to("/venues/#{venue.id}")
  end
  
  def update
    the_id = params.fetch("the_id")

    venue = Venue.where({ :id => the_id })
    matching_venue = venue.at(0)
    matching_venue.address = params.fetch("query_address")
    matching_venue.name = params.fetch("query_name")
    matching_venue.neighborhood = params.fetch("query_neighborhood")
    matching_venue.save
    
    redirect_to("/venues/#{matching_venue.id}")
  end

  def destroy
    the_id = params.fetch("toast_venue")
    matching_venues = Venue.where({ :id => the_id }).at(0)
    the_venue = matching_venues
    
    
    the_venue.destroy

    redirect_to("/venues")
  end

end
