class Listing < ActiveRecord::Base
  belongs_to :user
	default_scope -> { order('created_at DESC') }
	mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
	acts_as_taggable
	validates :picture, presence: true
	validate  :picture_size
	validates :tag_list, presence: true
	validates :detail, presence: true

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
