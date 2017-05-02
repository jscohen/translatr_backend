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

    song_text = get_full_lyrics(artist, title)

    @lyric.text = song_text

    @lyric.translation = translate(song_text)
    if @lyric.save
      render json: @lyric, status: :created, location: @lyric
    else
      render json: @lyric.errors, status: :unprocessable_entity
    end
  end

  def clean_lyrics(lyrics)
    local = lyrics
    local.split("").each do |i|
      if i == "%20"
        local.sub!(i, ' ')
      elsif i == '%0249'
        local.sub!(i, 'ù')
      elsif i == '%0217'
        local.sub!(i, 'Ù')
      elsif i == '%0192'
        local.sub!(i, 'À')
      elsif i == '%0224'
        local.sub!(i, 'à')
      elsif i == '%0232'
        local.sub!(i, 'è')
      elsif i == '%0200'
        local.sub!(i, 'È')
      elsif i == '%0242'
        local.sub!(i, 'ò')
      elsif i == "%27"
        local.sub!(i, '\'')
      elsif i == '%0236'
        local.sub!(i, 'ì')
      elsif i == '%0204'
        local.sub!(i, 'Ì')
      end
    end
    local
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
