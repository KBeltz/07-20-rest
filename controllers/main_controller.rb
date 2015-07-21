get "/" do
  erb :"/main/home"
end

post "/login" do
  user = User.where({email: params["email"]})
  @user = user[0]
  actual_password = BCrypt::Password.new(@user.password)
  attempted_password = params["password"]
    if actual_password == attempted_password
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/"
    end
end
