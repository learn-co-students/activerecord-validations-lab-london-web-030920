class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 100 }
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    validate :clickbait

    def clickbait
        if self.title && !self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
        
            self.errors[:title] << "Not clickbaittyyy!"
        end
    end

    
end
