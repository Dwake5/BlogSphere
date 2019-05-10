class Post < ApplicationRecord
    has_many :user_posts
    has_many :users, through: :user_posts
    has_many :comments

    after_initialize :default_values

    private
    
     def default_values
       self.img_url ||= 'https://www.idyllwildarts.org/wp-content/uploads/2016/09/blank-profile-picture.jpg'
     end

end
