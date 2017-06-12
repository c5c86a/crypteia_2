require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "GET / returns HTTP 200" do
      get '/'
      expect(response.status).to eq(200)
  end
end
