class Post < ApplicationRecord
    has_many :user_posts
    has_many :users, through: :user_posts
    has_many :comments

    after_initialize :default_values

    private
      def default_values
        self.img_url ||= 'https://www.acsp.org/resource/resmgr/images/Blog.jpg'
      end
end
