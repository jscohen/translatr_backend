class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :update, :destroy]

  # GET /albums
  def index
    @albums = Album.all
    render json: @albums
  end

  # GET /albums/1
  def show
    @album = Album.find(params[:id])
    render json: @album
  end

  # POST /albums
  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  # Authentication: Users can't change another user's albums
  def update
    if @album.user_id != update_params[:user_id].to_i
      render json: @album.errors, status: 403
      return
    end

    @album.update(update_params)

    if @album.update(update_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    # Authentication: Users can't change another user's albums

    if @album.user_id != destroy_params[:user_id].to_i
      render json: @album.errors, status: 403
      return
    end

    @album.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  def album_params
    params.require(:album).permit(:name, :song_id, :artist_id, :user_id)
  end

  def user_params
    params.require(:album).permit(:album_id)
  end

  def update_params
    params.require(:album).permit(:user_id, :name)
  end

  def destroy_params
    params.require(:album).permit(:user_id)
  end
end
