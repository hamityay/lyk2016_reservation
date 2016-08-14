class Comment < ApplicationRecord
  #validates :body, length { minimum: 15 }
  belongs_to :place
end
