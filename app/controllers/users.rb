get '/users/profile'  do

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
