class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  #before_action :edit_warning, only: :edit

  layout 'augmented'

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create

    if Artist.all.collect{|a| a.name}.include? params[:artist_name] 
      a = Artist.where(name: params[:artist_name])
      artist_id = a[0].id
      puts "Yep.  The Artist is here.  artist_id = #{artist_id}"
    else
      @artist=Artist.new(name: params[:artist_name])
      if @artist.name.empty?
        redirect_to action: :blank_artist and return
      elsif !@artist.save
        format.html { render action: 'new' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
      artist_id = @artist.id
      puts "Nope.  Artist wasn't there.  New artist_id = #{artist_id}"
    end

    if Album.all.collect{|a| a.album_title}.include? params[:album_name] 

      a = Album.where(album_title: params[:album_name])
      album_id = a[0].id
      puts "Yep.  The Album is here.  album_id = #{album_id}, artist_id = #{artist_id}"
    else
      @album=Album.new(album_title: params[:album_name], genre: params[:genre], artist_id: artist_id)
      puts "creating a new album with album title:  #{params[:album_name]},
        genre:  #{params[:genre]}, artist_id: #{artist_id}"
      if @album.album_title.empty?||@album.genre.empty?
        redirect_to action: :blank_album_data and return
      elsif !@album.save
        puts "In the failed album save branch."
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
      album_id = @album.id
      puts "Nope.  Album wasn't there.  New album_id = #{album_id}"
    end


    @song = Song.new(song_params)
    @song.album_id = album_id

    respond_to do |format|
      if @song.save
        format.html { render '/shared/created'}
        #format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:song_title, :track, :duration, :path, :filename, :composer)
    end

    def blank_album_data
    end
end
