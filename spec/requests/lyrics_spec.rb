require 'rails_helper'

RSpec.describe "Lyrics", type: :request do
  describe "GET /lyrics" do
    it "works! (now write some real specs)" do
      get lyrics_path
      expect(response).to have_http_status(200)
    end
  end
end
