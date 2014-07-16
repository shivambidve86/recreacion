class EventsController < ApplicationController
  before_action :set_event, only: [:new, :show, :edit, :update, :destroy]
  def index
    @events=Event.all
    @eventGroups=Eventgroup.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def create
    @event=Event.new(event_params)
    if @event.save
      redirect_to posts_path,  :notice => "Your event is saved"
    else
      render "new"
    end
  end

  def new
    @event=Event.new
  end



  def create
    @event=Event.new(event_params)

    respond_to do |format|
      if @event.save
        begin
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render action: 'show', status: :created, location: @event }
          logger.debug "Vendor is saved successfully"
        rescue SyntaxError, NameError => syserror
          logger.error "Vendor creation SyntaxError" + syserror
        rescue NoMethodError, NameError => nonerror
          logger.error "Vendor creation noerror" + nonerror
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        logger.error "Vendor creation has a issue"
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_name, :event_type, :location_address, :location_city, :location_country, :location_latitude, :location_longitude, :event_fromdate, :event_todate, :event_desctiption, :event_image)
  end

end
