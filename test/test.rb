ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../twitter.rb'


include Rack::Test::Methods
	
	def app
		Sinatra::Application
	end
	
describe "SYTW P2" do
  
  #Definir objeto para las pruebas

  it "Should return index" do
	get '/'
	assert last_response.ok?
  end  
  
#   it "Comprobar titulo" do
# 	get '/'
# 	assert_match "<title>SYTW - P2</title>", last_response.body
#   end
  
#   it "should return user's number of friends" do
# 	
#   end
  
end

