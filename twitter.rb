# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'



class MyApp
  
  require './configure'
  
  def dusuario(client, name)
	return client.user? name
  end

  
  def damigos (client, name)
	client = my_twitter_client()
	return client.friends(name,{})
  end
  
end



get '/' do
  @seguidores = []
  @name = ''
  @number = 0		
  erb :twitter
end

post '/' do
  @seguidores = []
  client = my_twitter_client() 
  @name = params[:firstname] || ''
  @number = params[:n].to_i
  @number = 10 if @number > 10
  tw = MyApp.new
  
	if (tw.dusuario(client, @name) == true)
	  amigos = tw.damigos(client, @name)
	  amigos = amigos.map { |i| [i.name, i.followers_count]}
	  amigos = amigos.sort_by { | x,y | -y}
	  @seguidores = amigos.take(@number)
	end
	erb :twitter
end
 