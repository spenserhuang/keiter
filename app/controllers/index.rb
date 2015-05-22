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
  first_name = params[:first_name]
  last_name = params[:last_name]
  phone_number = params[:phone_number]
  email = params[:email]
  username = params[:username]
  password = params[:password]

  @user = User.new(
      first_name: first_name,
      last_name: last_name,
      phone_number: phone_number,
      email: email,
      username: username,
      password: password,
    )

  if @user.save
    status 200
    redirect '/test'
  else
    status 404
    redirect '/sign_up'
  end
end

get '/test' do
  erb :test
end

# this grabs the sign in info from the user and determines
# if the user password is correct
post '/sign_in' do
  password = params[:password]
  @user = User.where(email: params[:email]).first

  if @user && @user.password == password
    # log_in(@user)
    status 200
    redirect '/test'
  else
    status 404
    redirect '/sign_in'
  end
end
