class SongsController < ApplicationController
  before_action :set_song, only: [:show]

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      session[:most_recent_song_id] = @song.id
      redirect_to @song
    else
      render :new
    end
  end

  def show
  end

  private

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title)
    end
end