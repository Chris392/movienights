# frozen_string_literal: true

# Controller handling everything regarding events
# Contains index/show/new/edit/create/update/destroy/set_event/event_params/invite/details/organisation/addmovie
class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy chat details organisation upvote invite addmovie]

  # GET /events or /events.json
  def index
    @all_events = Event.all

    @events = []

    @all_events.each do |event|
      next unless user_signed_in?

      @count = Event.find(event.id).users.all.where(id: current_user.id).count
      @creator = Event.find(event.id).user_id

      @events.push(event) if @count != 0 || @creator === current_user.id
    end
  end

  # GET /events/1 or /events/1.json
  def show
    # @the_event = Event.where(auth_token: params[:auth_token])
    @movie_suggestions = @event.movie_suggestions.order('cached_weighted_score DESC')
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        puts 'Saved'
        format.html { redirect_to login_success_event_path(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        puts 'Wrong Params'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find_by!(auth_token: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:date, :time, :adress, :user_id)
  end

  def invite
    unless params[:access].nil?
      @count = Event.find(@event.id).users.all.where(id: current_user.id).count

      if @count === 0
        user = User.find(current_user.id)
        @event.users.push(user)
        redirect_to @event
      end
    end
  end

  def details
    @movie_suggestions = @event.movie_suggestions.order('cached_weighted_score DESC')
  end

  def organisation
    @owner = @event.user
    @participants = @event.users
  end

  def addmovie
    @base_url = 'http://omdbapi.com/?'
    @api_partial_url = "apikey=#{ENV['OMDB_API_KEY']}"

    unless params[:search].nil?

      @search = URI.escape(params[:search])

      request = HTTP.get(@base_url + @api_partial_url + "&s=#{@search}&plot=full")
      @request_hash = JSON.parse(request)

    end

    unless params[:movie].nil?

      # Get the movie with the imdbID
      @search = params[:movie]

      @the_movie = JSON.parse(HTTP.get(@base_url + @api_partial_url + "&i=#{@search}&plot=full"))

      # If the movie isn't allready in the DB, then create & save the movie
      if Movie.where(title: @the_movie['Title']).empty?
        create_movie(@the_movie)
      else
        add_existing(@the_movie)
      end
    end
  end
end

def create_movie(the_movie)
  movie = Movie.create({ title: the_movie['Title'],
                         year: the_movie['Year'],
                         runtime: the_movie['Runtime'],
                         genre: the_movie['Genre'],
                         director: the_movie['Director'],
                         actors: the_movie['Actors'],
                         plot: the_movie['Plot'],
                         rating: the_movie['Rating'],
                         poster_url: the_movie['Poster'],
                         trailor_url: '' })
  movie.save
  add_to_event(movie)
end

def add_existing(the_movie)
  # if the movie is allready existing ...
  movie = Movie.where(title: the_movie['Title']).first
  # Add and Save the movie only if the MoviSuggestion doesn't exist for the actual event
  if MovieSuggestion.where(movie_id: movie.id, event_id: @event.id).empty?
    add_to_event(movie)
  else
    redirect_to @event, notice: 'Der Film ist bereits hinzugefügt geworden'
  end
end

def add_to_event(movie)
  ms = MovieSuggestion.create(movie_id: movie.id, event_id: @event.id)
  ms.save
  redirect_to @event, success: 'Film hinzugefügt!'
end
