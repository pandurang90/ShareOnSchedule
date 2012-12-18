module FbPostsHelper
  def post_status(post)
    if !post.is_posted
      "Not yet posted" 
    else 
      "Posted" 
    end
  end
end
