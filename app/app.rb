ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
# require_relative 'models/link'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  
  get '/' do
  	redirect '/links'
	end 

  get '/links' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb(:'links/index')
  end

	get '/links/new' do
		erb(:'links/new')
	end 

	post '/links' do
	 link = Link.new(url: params[:url],     # 1. Create a link
                title: params[:title])
	  tag  = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
	  link.tags << tag                       # 3. Adding the tag to the link's DataMapper collection.
	  link.save                              # 4. Saving the link.
	  redirect to('/links')
	end 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
