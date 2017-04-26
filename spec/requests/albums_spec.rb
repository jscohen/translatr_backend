# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Albums', type: :request do
  def albums
    Album.all
  end
  describe 'GET /albums' do
    it 'gets albums' do
      get '/albums'
      expect(response).to be_success
    end
  end
end
