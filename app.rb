require 'sinatra'
require "sinatra/json"
require_relative 'open_food_fact_client'

get '/ean/:ean' do
	allergens = OpenFoodFactClient.get(params[:ean])
	json allergens
end

