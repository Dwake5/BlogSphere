class User < ApplicationRecord
    has_many :user_posts
    has_many :posts, through: :user_posts
    has_many :comments
    has_one_attached :avatar

    validates :name, :email, :password_digest, presence: true
    validates :email, uniqueness: true
    has_secure_password

    after_initialize :default_values

    private
      def default_values
        self.img_url ||= 'https://www.idyllwildarts.org/wp-content/uploads/2016/09/blank-profile-picture.jpg'
      end
end
