class LandmarksController < ApplicationController
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do  
    @landmarks = Landmark.all
    erb :'landmarks/new'
  end

  post '/landmarks' do 
    @landmark = Landmark.new(params[:landmark])
    @landmark.save 

    redirect '/landmarks'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save 
    redirect :"/landmarks/#{@landmark.id}"
  end
end
