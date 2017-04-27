# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Albums', type: :request do
  def album_params
    {
      title: '20'
    }
  end

  def albums
    Album.all
  end

  def album
    Album.first
  end

  describe 'GET /albums' do
    it 'gets albums' do
      get '/albums'
      expect(response).to be_success
    end
  end

  describe 'GET /albums/:id' do
    it 'shows one album' do
      get "/albums/#{album.id}"
      expect(response).to be_success
      album_response = JSON.parse(response.body)

      expect(album_response['id]']).not_to be_nil
      expect(album_response['title']).to eq(album_params['title'])
    end
  end
end
