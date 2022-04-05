class Author < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :phone_number, length: { is: 10 }



    def create
        author = Author.create(author_params)
        render json: author, status: :created
      end
end
