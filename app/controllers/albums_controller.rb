class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.sorted
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create

    artist_id = artist_exist_or_new(params[:artist_name])

    @album = Album.new(album_params)
    @album.artist_id = artist_id

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update

    artist_id = update_artist_exist_or_new(params[:artist_name])


    respond_to do |format|
      @album.artist_id = artist_id
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:album_title, :year, :genre, :protected, :artist_id)
    end

    def blank_artist
    end

    def artist_exist_or_new(artist_name)
      if Artist.all.collect{|a| a.name}.include? artist_name 
        a = Artist.where(name: artist_name)
        artist_id = a[0].id
      else
        @artist=Artist.new(name: artist_name)
        if @artist.name.empty?
          redirect_to action: :blank_artist and return
        elsif @artist.save!
          format.html { render action: 'new'}
          format.json { render json: @artist.errors, status: :unprocessable_entity }
        end
        artist_id = @artist.id
      end
    end

    def update_artist_exist_or_new(artist_name)
      if Artist.all.collect{|a| a.name}.include? artist_name
        a = Artist.where(name: artist_name)
        artist_id = a[0].id
      else
        # params[:artist_name] = "Fred"
        @artist=Artist.new(name: artist_name)
        if @artist.name.empty?
          redirect_to action: :blank_artist and return
        else 
          @artist.save!
        end
        artist_id = @artist.id
      end
    end

end
