require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /" do
    it "returns HTTP status 200" do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
end
