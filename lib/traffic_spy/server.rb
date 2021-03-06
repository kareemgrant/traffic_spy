module TrafficSpy
  class Server < Sinatra::Base
    set :views, 'lib/views'

    post '/sources' do
      response_for(SourcesController.create(params))
    end

    post '/sources/:application/data' do
      response_for(DataController.create(params))
    end

    get '/' do
      erb :index
    end

    not_found do
      erb :error
    end

    def response_for(response)
      status response.status
      body   response.body
    end
  end

end