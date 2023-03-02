class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  def count_updater(post_id)
    post = Post.find_by(id: post_id)
    post.comments_counter = Comments.where(Post_id:).count
    post.save
  end
end
