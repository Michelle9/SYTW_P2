ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../twitter.rb'


include Rack::Test::Methods
	
	def app
		Sinatra::Application
	end
	
describe "SYTW P2 - page" do
  

  it "Should return index" do
	get '/'
	assert last_response.ok?
  end  
  
  it "should return title" do
	get '/'
	assert_match "<title> Amigos más populares en Twitter </title>", last_response.body
  end
  
  it "should return foot" do
	get '/'
	assert_match "<p> <b>© SYTW  </b> - Práctica 2 © - Realizado por: <b>Jhoanmary Prz Fariña y Santiago Sainz Fdez.</b></p>", last_response.body
  end
  
  it "should return form" do
	get '/'
	assert_match "<p ><b>Introduzca su nombre en Twitter: </b></p>", last_response.body
	assert_match "<p ><b>¿Cuántos seguidores desea ver? </b></p>", last_response.body
  end

  
end

describe "SYTW P2 - Funtions" do
  before :all do
	@tw = MyApp.new
	@client = my_twitter_client()
	@name1 = "jhoampf"
	@name2 = "jjhhooaampf"
  end
  
  it "the user exist" do
	assert @tw.dusuario(@client,@name1)
  end
  
  it "the user not exist" do
	refute @tw.dusuario(@client, @name2)
  end
end
