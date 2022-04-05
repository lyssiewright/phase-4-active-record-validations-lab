class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250} 
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_cannot_be_true_facts

  def title_cannot_be_true_facts
    if :title === "True Facts"
      errors.add(:title, "Can't be that title")
    end
  end


    def create
        post = Post.create(post_params)
        render json: post, status: :created
      end
end
