class Article < ApplicationRecord
    belongs_to :user, optional: true
    has_many :article_categories
    has_many :categories, through: :article_categories
    
    has_one_attached :picture do |attachable|
      attachable.variant :thumb, resize: "100x100"
    end
    
    validates :title, presence:true, length: { minimum: 6, maximum: 100 }
    validates :description, presence:true, length: { minimum: 10, maximum: 300 }
    
    
end


