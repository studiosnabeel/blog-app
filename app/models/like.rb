class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :count_updater

  private

  def count_updater
    post.increment!(:likes_counter)
  end
end
