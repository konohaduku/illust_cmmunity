class Illust < ApplicationRecord
   has_many_attached :illust_images
    acts_as_taggable_on :tags
     belongs_to :user
     has_many :illust_comments, dependent: :destroy
     has_many :favorites, dependent: :destroy
    # attachment :illust_image_id



  validates :illust_name,presence:true
  validates :illust_body,presence:true,length:{maximum:200}

def favorited?(user)
favorites.where(user_id: user.id).exists?
end

def get_illust_image(width, height)
    unless illust_images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      illust_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    illust_images.variant(resize_to_limit: [width, height]).processed
end

def self.looks(search, word)
    if search == "perfect_match"
      @illust = Illust.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @illust = Illust.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @illust = Illust.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @illust = Illust.where("title LIKE?","%#{word}%")
    else
      @illust = Illust.all
    end
end

end
