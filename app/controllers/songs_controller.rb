class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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

  # GET /tag_entry
  def tag_entry
    @tag_file_name = params[:tag_file_name]
    path = File.expand_path("~/#{@tag_file_name}")
    begin
      @tag = ID3.new(path)
      # puts "Artist = #{@tag.artist}"
      # puts "Album = #{@tag.album_title}"
      # puts "Song Title = #{@tag.song_title}"
      # puts "Song Title Class = #{@tag.song_title.class}"
    rescue
      @err_msg = "Bad .mp3 file name.  Unable to open file."
      render action: :song_error and return
    end
    @song=Song.new
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

    artist_id = artist_exist_or_new(params[:artist_name])

    album_id = album_exist_or_new(params[:album_name], params[:genre], artist_id)

    @song = Song.new(song_params)
    @song.album_id = album_id

    respond_to do |format|
      if @song.save
        format.html { render '/shared/created'}
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

    artist_id = update_artist_exist_or_new(params[:artist_name])

    album_id = update_album_exist_or_new(params[:album_name], params[:genre], artist_id)

    respond_to do |format|

      @song.album_id = album_id
      a = @song.album
      a.artist_id = artist_id
      a.save

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

    def song_error
      puts "In song_error method, @err_msg = #{@err_msg}"
    end

    def artist_exist_or_new(artist_name)
      if Artist.all.collect{|a| a.name}.include? artist_name 
        a = Artist.where(name: artist_name)
        artist_id = a[0].id
      else
        @artist=Artist.new(name: artist_name)
        if @artist.name.empty?
          @err_msg = "The Album data requires an Artist, an Album Title and a Genre."
          render action: :song_error and return
        elsif !@artist.save
          format.html { render action: 'new' }
          format.json { render json: @artist.errors, status: :unprocessable_entity }
        end
        artist_id = @artist.id
      end
    end

    def album_exist_or_new(album_name, genre, artist_id)
      if Album.all.collect{|a| a.album_title}.include? album_name 
        a = Album.where(album_title: album_name)
        album_id = a[0].id
      else
        @album=Album.new(album_title: album_name, genre: genre, artist_id: artist_id)
        if @album.album_title.empty?||@album.genre.empty?
          @err_msg = "The Album data requires an Artist, an Album Title and a Genre."
          render action: :song_error and return
        elsif !@album.save
          format.html { render action: 'new' }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
        album_id = @album.id
      end
    end      

    def update_artist_exist_or_new(artist_name)
      if Artist.all.collect{|a| a.name}.include? artist_name 
        a = Artist.where(name: artist_name)
        artist_id = a[0].id
      else
        @artist=Artist.new(name: artist_name)
        if @artist.name.empty?
          @err_msg = "The Album data requires an Artist, an Album Title and a Genre."
          render action: :song_error and return
        elsif !@artist.save
          format.html { render action: 'new' }
          format.json { render json: @artist.errors, status: :unprocessable_entity }
        end
        artist_id = @artist.id
      end
    end

    def update_album_exist_or_new(album_name, genre, artist_id)
      if Album.all.collect{|a| a.album_title}.include? album_name 
        a = Album.where(album_title: album_name)
        album_id = a[0].id
      else
        @album=Album.new(album_title: album_name, genre: genre, artist_id: artist_id)
        if @album.album_title.empty?||@album.genre.empty?
          @err_msg = "The Album data requires an Artist, an Album Title and a Genre."
          render action: :song_error and return
        else
         @album.save
        end
        album_id = @album.id
      end
    end

end
