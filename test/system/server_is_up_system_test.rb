describe Server::API do
  context 'GET /' do
    it 'returns HTTP 200' do
      get '/'
      expect(response.status).to eq(200)
    end
  end
end
