class Question < ApplicationRecord
  belongs_to :story
  has_many :statuses
  has_many :users, through: :statuses
end
