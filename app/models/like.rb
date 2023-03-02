class Like < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  def count_updater(post_id)
    post = Post.find_by(id: post_id)
    post.likes_counter = likes.where(post_id:).count
  end
end
