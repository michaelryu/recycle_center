class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :listing
  validates :post, presence:true
  validates :content, presence:true, length: { in: 2..1000 }
end
