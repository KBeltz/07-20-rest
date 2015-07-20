# RESTful Routes + User Authentication + AJAX + Deploying Atomic Exercises

You should deploy the project to Heroku after each primary step (1-7) below.

1. Build a new Sinatra application for the CRUD operations of User. Keep it simple.
  - Define your routes according to the RESTful pattern.
  - Don't worry about authentication just yet.
    * You can still add a password column to the database, so that you don't have to deal with adding a single column to the table later. But don't build any functionality around it yet.
  - Use ActiveRecord and Bundler (This is the new default – always use these tools.)
2. Add another resource Story.
  - A user has many stories. A story belongs to a user.
  - Implement the CRUD operations for a story.
    * Some differences:
      * The index view of stories should show all the stories for a given user. There is no view that shows all stories for everyone.
      * The actions for creating a new story (the form and the saving action) should be scoped to a given user. (This means using nested RESTful routes.)
  - Define your routes according to the RESTful pattern.
  - Again, don't build authentication yet. Focus on CRUD and the RESTful pattern.
  - _Upon completion, submit for quick approval/feedback. (See the protocol below.)_
3. Implement user auth.
 - No one should be able to edit or delete a user except that user.
 - No one should be able to create, edit, or delete a story except that story's user.
 - Anyone should be able to view the users index, a user's detail page, an index of stories, and a story's individual page.
4. There is now some undesirable superfluousness in the routes, which is being caused by the RESTful pattern not always suiting us well.
  1. When a user is logged in, the URL for editing their profile is something like /users/6/edit. But no one else can edit that profile–only them. So there's no need to display the user's ID. Refactor the route so the path is only /edit_profile. You can get the ID from the session.
  2. Perform a similar refactoring for deleting a user.
  3. A story can only be created by the logged in user, so a route path like /users/6/stories/new is bloated. Refactor so that the path is /new_story.
  4. Perform a similar refactoring for editing and deleting stories.
  5. _Upon completion, submit for quick approval/feedback._
5. Consider a resource like Vote, which would belong to a story. Would you want to use the RESTful routes pattern for its implementation? Sketch out some sample routes and controller actions if that helps you weigh the pros/cons and visualize the path to building the resource out.
  - Write an article about your thoughts and describe the specific plan you would take to build the resource.
  - Include details about the columns for the votes table, methods you might need to add to the Vote class yourself, what actions (and the related arguments) the controller would contain, and how the UX for various pages would need to change to accommodate voting.
  - Don't actually build any of this yet. It's important to practice visualizing features and thinking through the concepts, even though it may feel easier something to "just build it".
6. When finished, build the voting feature.
  - _Upon completion, submit for quick approval/feedback._
7. Use AJAX to improve the UX of voting.
