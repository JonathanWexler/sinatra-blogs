require 'sinatra'
require 'sinatra/activerecord'


set :database, "sqlite3:wobbles.sqlite"
require './models'

set :sessions, true

get '/' do
session[:user_id] = 31

    if current_user
        erb :secrets
    else
        @users = User.all 
        erb :home
    end

end



# 9 It goes to the / route
# 10 Runs the current_user function
# 31 checks if the user_id exists in the session hash
#   32 if it exits, finds the corresponding user in the DB, and sets it to current_user variable, and returns it to where that function is called
#   36 return nil
# 10 either nil is placed here, or @current_user


get '/delete/:id' do |id|
    User.destroy(id)
    redirect '/'
end


def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
  end
end