ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../twitter.rb'

include Rack::Test::Methods
	
	def app
		Sinatra::Application
	end
	
describe "SYTW P2" do

  it "Mostrar pagina principal" do
	get '/'
	assert last_response.ok?
  end  
  
end

