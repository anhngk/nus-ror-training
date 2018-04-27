  Controller:

- 2 kinds of parameter :
  + Query string parameters : everything after "?" in the URL
  + POST data

@post = Post.create(user_id = @user.id)
post = Post.where(user_id: 5)