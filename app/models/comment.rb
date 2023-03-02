class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :count_updater

  def count_updater
    post.increment!(:comments_counter)
  end
end
