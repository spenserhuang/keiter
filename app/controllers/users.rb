get '/users/profile'  do
@profile = User.find_by(user_id: session[:user_id])
erb :'/users/profile'
end


get '/users/:username' do
@user = User.find_by(username: params[:username])
@keit = Keit.find_by(user_id: @user.id)
erb :'/users/index'
end

post '/keits/' do
  Keit.create(text: params[:text], user_id: session[:user_id])
  redirect '/users/:username'
end


get '/users/profile/edit' do
erb :'/users/edit'
end

put '/users/profile' do
@editprofile = User.find_by(user_id: session[:user_id])
@editprofile.update_attributes(username: params[:username], password_hash: params[:password_hash], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number])
redirect '/users/profile'
end