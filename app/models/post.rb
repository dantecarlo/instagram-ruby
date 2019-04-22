class User < ApplicationRecord
    has_many :posts, dependent: :destroy
end

class Post < ApplicationRecord
    belongs_to :user

    has_one_attached :image

    validate :image_presence

    def image_presence
        error.add(:image, "can't be blank") unless image.attached?
    end
end
