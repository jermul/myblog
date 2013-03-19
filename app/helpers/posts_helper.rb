module PostsHelper
  def join_tags(post)
  	post.tag_list.map { |t| link_to t, tag_path(t) }.join(', ')
  end
end
