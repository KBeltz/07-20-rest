get "/users/new" do
  erb :"users/new"
end

post "/users/create" do
  email = params["email"]
  password = BCrypt::Password.create(params["password"])
  User.create({email: email, password: password})
  redirect "/users/#{user.id}" 
end

get "/users/:id" do
  @user = User.find(:id)
  erb :"users/show_user"
end



get "/users" do # Show all users
  @array_of_users = User.all?
end
