class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :topic_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  validates :name, presence: true
  validates :overview, presence: true

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

end
