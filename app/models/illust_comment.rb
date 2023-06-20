class IllustComment < ApplicationRecord

  belongs_to :user
  belongs_to :illust

  validates :illust_comment, presence: true
end
