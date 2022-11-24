class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :topic_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @topic = Topic.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @topic = Topic.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @topic = Topic.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @topic = Topic.where("name LIKE?","%#{word}%")
    else
      @topic = Topic.all
    end
  end

  has_one_attached :profile_image

  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
