class Post < ApplicationRecord
    #validate All posts have a title
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_clickbait
    def title_is_clickbait
        if title && !title.include?("Won't Believe")
            errors.add(:title, "must be clickbait")
        end
    end



end
