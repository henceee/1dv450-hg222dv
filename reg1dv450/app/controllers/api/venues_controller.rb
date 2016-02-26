class Api::VenuesController < Api::ApiController
    before_filter :find_venue

    
    def find_venue
        unless params[:id].nil?
         @venue = Venue.find_by_id(params[:id])
        end
    end
    
    def index
       @venues = Venue.all
       unless @venues.nil?
       respond_with status: 200,        venues: @venues,
                    selfURL: api_venues_path
       else
       end
    end   
    
    def show
        unless  @venue.nil?
            respond_with status: 200,     venue: @venue,     selfURL: api_venue_path,
                         shows: @venue.shows
        else
            respond_with status: 404, message: "Artist not found"
        end
    end
    
    def create
        @venue = Venue.new(venue_params.except(:shows))
        
        #If there are any artists to be saved with this show
        if venue_params[:shows].present?
            show_params= venue_params[:shows]

            show_params.each do |show|
                if Show.exists?(show)
                  @venue.shows << Show.find_by_name(show["name"])
                else
                  @venue.shows << Show.new(show)
                end
            end
    
        end
        
        if @venue.save
            render  status: 201,
                    json:{  
                            message: "Successfully created venue.",
                            venue: @venue,
                            shows: @venue.shows
                         }
        else
            render  status: 422,
                    json:{  
                            message: "Could not create venue.",
                         }
        end

    end
    
    #PUT    /api/shows/:id(.:format)      
    def update
        unless @venue.nil?
            if @venue.update(venue_params)
                render  status: 200,                            
                        json: { message: "Successfully updated venue.",
                                venue: @venue                            
                              }
            else
                render  status: 422, 
                        json: { 
                                message: "Venue update failed.",
                                errors: @venue.errors
                              }
            end
        else
            render  status: 404, 
                    json: {
                            message: "Venue not found",
                            errors: @venue.errors
                          }
        end
    end
    
    def destroy
        unless  @venue.nil?
            if @venue.destroy
                render  status: 200,
                        json: { message: "Venue successfully deleted.",
                                venue: @venue,
                              }
                        
            else
                render  status: 422,
                        json: {
                                message: "Venue update failed.",
                                errors: @venue.errors
                              }
            end
        else
            render  status: 404,
                    json: {
                            message: "Venue not found",
                            errors: @venue.err
                          }
        end
    end
    
     #Validation of params
    private
    def venue_params
    params.require(:venue).permit(:venueName, :longitude, :latitude, :adress, shows: [:name, :description])
    end
end
