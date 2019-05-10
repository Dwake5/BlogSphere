class Post < ApplicationRecord
    has_many :user_posts
    has_many :users, through: :user_posts
    has_many :comments

    # after_initialize :default_values

    private
      def default_values
        self.img_url ||= 'Enter default post picture here'
      end
end
