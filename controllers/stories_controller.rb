get "/users/:user_id/stories/new" do # Bring up form to create Story
  @user = User.find(params[:user_id])
  erb :"/stories/new"
end

post "/users/:user_id/stories" do # Create a Story
  title = params["title"]
  story = Story.create({title: title, user_id: params["user_id"]})
  user = User.find(params["user_id"])
  redirect "/users/#{user.id}/stories/#{story.id}"
end

###########################################################################
# working ^^
###########################################################################
get "/stories/delete_form" do
  @array_of_stories = Story.all
  erb :"/stories/delete_form"
end

get "/users/:user_id/stories/:id/edit" do # Story edit form
  @story = Story.find(params[:id])
  erb :"/stories/edit_form"
end

put "/users/:user_id/stories/:id" do #Update a specific Stories
  story = Story.find(params[:id])
  story.update_attributes(title: params["title"])
  story.save
  erb :"/stories/success"
end

post "/users/:user_id/stories/:id" do # Delete a specific Story
  story = Story.find(params["story_id"])
  story.destroy
  erb :"/stories/deleted"
end

get "/users/:id/stories/:id" do # Find a specific Story
  @story = Story.find(params[:id])
  @user = User.find(@story.user_id)
  @user_stories = @user.stories
  erb :"/stories/show_story"
end

#/users/:user_id/stories
#/users/:user_id/stories/new
