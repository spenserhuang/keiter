# this renders sign in page/sign up button
get '/' do
  erb :index
end

# this renders the sign up form
get '/sign_up/new' do
  erb :sign_up
end

# this recieves the user's sign up info
# and saves it to the database
post '/sign_up' do

  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    phone_number: params[:phone_number],
    email: params[:email],
    username: params[:username],
    password_hash: params[:password]
  )


  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{current_user.username}"
  else
    redirect '/sign_up'
  end
end

get '/test' do
  erb :test
end

# this grabs the sign in info from the user and determines
# if the user password is correct
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


