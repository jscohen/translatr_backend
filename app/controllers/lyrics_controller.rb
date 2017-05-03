load 'lyrics-api.rb'
load 'translate-api.rb'

class LyricsController < ApplicationController
  before_action :set_lyric, only: [:show, :update, :destroy]

  # GET /lyrics
  def index
    @lyrics = Lyric.all

    render json: @lyrics
  end

  # GET /lyrics/1
  def show
    render json: @lyric
  end

  # POST /lyrics
  def create
    @lyric = Lyric.new(lyric_params)

    artist = lyric_params[:artist]
    title = lyric_params[:title]

    # Call get_full_lyrics function from lyrics-api.rb
    # Pass the artist and title
    # Store the lyrics in song_text
    song_text = get_full_lyrics(artist, title)

    # Add lyrics to text file of Lyric object
    @lyric.text = song_text

    # Get translation of lyrics and add them to translation field
    # Use translate function from the translate-api.rb file
    @lyric.translation = translate(song_text)
    if @lyric.save
      render json: @lyric, status: :created, location: @lyric
    else
      render json: @lyric.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lyrics/1
  def update
    if @lyric.update(lyric_params)
      render json: @lyric
    else
      render json: @lyric.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lyrics/1
  def destroy
    @lyric.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lyric
      @lyric = Lyric.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lyric_params
      params.require(:lyrics).permit(:song_id, :artist, :title)
    end
end
