class Tweet < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :title, :text, :image, presence: true

end
