module PostsHelper
  def popular_post_div(posts, current_user)
    raw(
    posts.find_each do |post|
      '<h4><%= link_to post, user_post_path(current_user,post) %></h4>'.'<%= post.text %>'.join("")
    end
    )
  end

  def recent_commenters(post)
      raw(post.comments.recent(5).collect{|comment| comment.user.login}.map{|commenter| "<li>#{commenter}</li>"}.join(""))
   end
end
