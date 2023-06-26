class IllustImage < ApplicationRecord

  belongs_to :illust
  attachment :image
end
