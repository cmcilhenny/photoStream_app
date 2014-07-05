class PhotosController < ApplicationController
  respond_to :json

  before_filter :signed_in_user, only: [:destroy]
  # before_filer :event_id

  def index
    event_id 
    @photos = @event.photos

   #using map to create an array that holds the image urls
    arrayPhotos = @event.photos.map do |photo|
      photo.image.url
    end
    #storing array to pass into javascript
    gon.arrayPhotos = arrayPhotos
    #storing the event id
    gon.eventId = @event.id
    #storing url 
    gon.url = event_photos_path + ".json"
    #implementing JSON instead of using gon for displaying photos
    respond_with(arrayPhotos) do |format|
      format.html {render "index"}
      format.json {render json: arrayPhotos.as_json}
    #event.photos.order
    end
  end

  def show
    #all photos are nested under an event. To show a photo, first look up the event via the event_id. 
    event_id 
    @photo = @event.photos.find(params[:id])
  end

  def new
    #same as show.
    event_id
    @photo = @event.photos.new
  end

  def create
    #when uploading a new photo, ensure that the photo has an event id.
    #First find the event that the photo is linked to (via the route used to upload photos)
    event_id
    #create a new photo 
    @photo = @event.photos.new photo_params
    #if photo save, saves the photo if the above two lines run and redirect you to a page to view the individual photo, plus confirmation message.
    if @photo.save
      redirect_to event_photo_path(@event.custom_url, @photo), notice: 'Your photo has been added!'
    #if save doesn't work, communicate it didn't work and redirect to upload page.
    else
      flash[:error]='Something went wrong. Please try again.'
      redirect_to new_event_photo_path
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.delete
    redirect_to photos_path
  end

# adding search method for photo search
  def search
    event_id
    @search = SimpleSearch.new SimpleSearch.get_params(params)
    if @search.valid?
      @photos = @search.search_within Photo.all, :image_file_name
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :image)
    end
    # new method to DRY up code.
    def event_id
      @event = Event.where(custom_url: params[:event_id]).first
    end
end
