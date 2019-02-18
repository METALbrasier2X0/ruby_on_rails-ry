class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    acts_as_commontable dependent: :destroy
    mount_uploader :image, PhotoUploader
end
