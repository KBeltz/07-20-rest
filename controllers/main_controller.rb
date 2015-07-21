get "/" do
  erb :"/main/home"
end
#change to post
post "/login" do
  # auth stuff
  @user = User.where({email: params["email"]})
  actual_password = BCrypt::Password.new(@user[0].password)
  attempted_password = params["password"]
    if actual_password == attempted_password
      redirect "/users/@user[0].id"
    else
      redirect "/"
    end
end
