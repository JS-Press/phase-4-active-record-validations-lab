class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :is_clickbait?

# def either_or
#     unless category.match?("Fiction") || category.match?("Non-Fiction")
#         errors.add(:category,"Nope")
#     end
# end

CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

def is_clickbait? 
    if CLICKBAIT_PATTERNS.none? { |it| it.match title }
        errors.add(:title, "must be clickbait")
      end
    end

end
