class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

# 空投稿を保存しないよう
  validates :text, presence: true
end
