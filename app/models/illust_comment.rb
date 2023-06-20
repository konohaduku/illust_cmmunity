class IllustComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :illust

  validates :comment, presence: true
end
