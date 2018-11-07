class UserVisiblePostsQuery
  def self.call(user, relation: Post.all)
  	relation.where(user_id: user.following_users.ids << user.id)
  end
end