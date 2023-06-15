class Illust < ApplicationRecord
   has_many_attached :illust_image
    acts_as_taggable_on :tags
     belongs_to :user
     has_many :illust_comments, dependent: :destroy
     has_many :favorites, dependent: :destroy

  validates :illust_name,presence:true
  validates :illust_body,presence:true,length:{maximum:200}

#   def get_image(width, height)
#     unless illust_image.attached?
#       file_path = Rails.root.join('app/assets/images/no_image.jpg')
#       item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
#     end
#     illust_image.variant(resize_to_fill: [width, height]).processed
#   end



end
