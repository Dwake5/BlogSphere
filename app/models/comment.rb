class Comment < ApplicationRecord
    belongs_to :post, dependent: :destroy
    belongs_to :user, dependent: :destroy

    validates :content, length: { minimum: 2 }

end
