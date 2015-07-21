get "/" do
  erb :"/main/home"
end
#change to post
post "/login" do
  # auth stuff
  user = User.where({email: params["email"]})
  @user = user[0]
  binding.pry
  actual_password = BCrypt::Password.new(@user.password)
  attempted_password = params["password"]
    if actual_password == attempted_password
      erb :"/users/@user.id"
    else
      erb :"/"
    end
end
