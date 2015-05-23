get '/' do
  erb :index
end

get '/sign_up/new' do
  erb :sign_up
end

post '/sign_up' do
  @user = User.new(
    first_name:    params[:first_name],
    last_name:     params[:last_name],
    phone_number:  params[:phone_number],
    email:         params[:email],
    username:      params[:username],
    password_hash: params[:password]
  )

  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{current_user.username}"
  else
    redirect '/sign_up'
  end
end

post '/sign_in' do
  password_hash = params[:password]
  user = User.find_by(username: params[:username])
  if user && user.password_hash == password_hash
    session[:user_id] = user.id
    redirect "/users/#{current_user.username}"
  else
    redirect '/'
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end
