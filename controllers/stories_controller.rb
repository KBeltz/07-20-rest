get "/stories/new" do # Bring up form to create Story
  erb :"stories/new"
end

post "/stories/create" do # Create a Story
  user_id = User.where(:email => params["user_email"])[0].id
  title = params["title"]
  story = Story.create({title: title, user_id: user_id})
  redirect "/stories/#{story.id}"
end

get "/stories" do # Show all Stories
  @array_of_stories = Story.all
  erb :"/stories/all_stories"
end

get "/stories/delete_form" do
  @array_of_stories = Story.all
  erb :"/stories/delete_form"
end

get "/stories/:id/edit" do # Story edit form
  @story = Story.find(params[:id])
  erb :"/stories/edit_form"
end

put "/stories/:id" do #Update a specific Stories
  binding.pry
  story = Story.find(params[:id])
  story.update_attributes(title: params["title"])
  story.save
  erb :"/stories/success"
end

post "/stories/:id" do # Delete a specific Story
  story = Story.find(params["story_id"])
  story.destroy
  erb :"/stories/deleted"
end

get "/stories/:id" do # Find a specific Story
  @story = Story.find(params[:id])
  @user = User.find(@story.user_id)
  @user_stories = @user.stories
  erb :"/stories/show_story"
end

#/users/:user_id/stories
#/users/:user_id/stories/new
