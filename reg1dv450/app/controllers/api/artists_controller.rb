class Api::ArtistsController < Api::ApiController
    before_filter :find_show

    
    def find_show
        unless params[:id].nil?
         @artist = Artist.find_by_id(params[:id])
        end
    end
    
    
    def index
       @artists = Artist.all
       unless @artists.nil?
       respond_with status: 200,        artists: @artists,
                    selfURL: api_artists_path
       else
       end
       
    end   
    
    def show
        unless  @artist.nil?
            respond_with status: 200,     artist: @artist,     selfURL: api_artist_path
        else
            respond_with status: 404, message: "Artist not found"
        end
    end
    
    def new
        @artist = Artist.new
    end
    
    def create
        @artist = Artist.new(artist_params)
     
        if @artist.save
            render  status: 201,
                    json:{  
                            message: "Successfully created artist.",
                            artist: @artist,
                            
                         }
        else
            render  status: 422,
                    json:{  
                            message: "Could not create artist.",
                         }
        end

    end
    
    def update
        unless @artist.nil?
            if @artist.update(artist_params)
                render  status: 200,                            
                        json: { message: "Successfully updated artist.",
                                artist: @artist                            
                              }
            else
                render  status: 422, 
                        json: { 
                                message: "Artist update failed.",
                                errors: @artist.errors
                              }
            end
        else
            render  status: 404, 
                    json: {
                            message: "Artist not found",
                            errors: @artist.errors
                          }
        end
    end
    
    def destroy
        unless  @artist.nil?
            if @artist.destroy
                render  status: 200,
                        json: { message: "Artist successfully deleted.",
                                artist: @artist,
                              }
                        
            else
                render  status: 422,
                        json: {
                                message: "Artist update failed.",
                                errors: @artist.errors
                              }
            end
        else
            render  status: 404,
                    json: {
                            message: "Artist not found",
                            errors: @artist.err
                          }
        end
    end
    
    private
    def artist_params
        params.require(:artist).permit(:name)
    end
    
   
end
