require 'sinatra/base'
require 'sinatra/multi_route'

class App < Sinatra::Base
  register Sinatra::MultiRoute

  route :get, :post, :put, :patch, :delete, :options, :link, :unlink, '*' do
    request.body.rewind

    resp = ""

    resp += "URL: #{request.url} <br />\n"
    resp += "Method: #{request.request_method} <br />\n"
    resp += "Body: #{request.body.read} <br />\n"
    resp += "Path: #{request.path}"

    resp
  end
end
