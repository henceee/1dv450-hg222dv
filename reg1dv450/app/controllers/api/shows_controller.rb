class Api::ShowsController < Api::ApiController
    before_filter :find_show
  
      
    def find_show
        unless params[:id].nil?
        @show   = Show.find_by_id(params[:id])
        end
    end
    
    def index
        
        if params[:artist_id].present?
            artist = Artist.find_by_id(params[:artist_id]) 
            shows =  artist.shows
        elsif params[:creator_id].present?
            creator = Creator.find_by_id(params[:creator_id])
            shows = creator.shows
        elsif params[:lat].present? && params[:long].present?

            venues = Venue.near([params[:lat],params[:long]],100,units: :km)    
            shows =[]
            venues.each do |venue|
                venue.shows.each do |show|
                    shows.push(show)
                end
            end
        elsif params[:adress].present?
            venues = Venue.near(params[:adress],100,units: :km)
            shows =[]
            venues.each do |venue|
                venue.shows.each do |show|
                    shows.push(show)
                end
            end
        else
         shows = Show.all
        end
       unless @shows.nil?
       
       shows = shows.drop(@offset)
       shows = shows.take(@limit)
       
       respond_with status: 200,        shows: shows,
                    selfURL: api_shows_path
       else
           respond_with status: 404,    selfURL: api_shows_path
       end
        
    end   

    
    #GET:  /api/shows/:id(.:format)
    def show
        unless  @show.nil?
        respond_with status: 200,                               show: @show ,
                     artist: @show.artists,                    showURL: api_show_path,
                     venueURL: api_venue_path(@show.venue_id)   

        else
            respond_with status: 404, message: "Show not found"
        end
    end
    
    def new
        @Show = Show.new
    end
    
    #POST   /api/shows(.:format)   
    def create
        
       @show = Show.new(show_params.except(:artists))
       @show.creator_id = @current_user
        ##TODO ONLY IF AUTH.
        #If there are any artists to be saved with this show
        if show_params[:artists].present?
            artist_params = show_params[:artists]

            artist_params.each do |artist|
                if Artist.exists?(artist)
                  @show.Artist << Artist.find_by_name(artist["name"])
                else
                  @show.artists << Artist.new(artist)
                end
            end
    
        end
        
        if @show.save
            render  status: 201,
                    json:{  
                            message: "Successfully created show.",
                            show: @show,
                            artists: @show.artists
                         }
        else
            render  status: 422,
                    json:{  
                            message: "Could not create show.",
                         }
        end
       
    end
    
    #PUT    /api/shows/:id(.:format)      
    def update
        unless @show.nil?
            if @show.update(show_params)
                render  status: 200,                            
                        json: { message: "Successfully updated show.",
                                show: @show                            
                              }
            else
                render  status: 422, 
                        json: { 
                                message: "Show update failed.",
                                errors: @show.errors
                              }
            end
        else
            render  status: 404, 
                    json: {
                            message: "Show not found",
                            errors: @show.errors
                          }
        end
    end
    
    #DELETE /api/shows/:id(.:format)
    def destroy
        unless  @show.nil?
            if @show.destroy
                render  status: 200,
                        json: { message: "Show successfully deleted.",
                                show: @show,
                              }
                        
            else
                render  status: 422,
                        json: {
                                message: "Show update failed.",
                                errors: @show.errors
                              }
            end
        else
            render  status: 404,
                    json: {
                            message: "Show not found",
                            errors: @show.err
                          }
        end
    end
    
    #Validation of params
    private
    def show_params
    params.require(:show).permit(:name, :description, artists: [:name])
    end
    
    
end
