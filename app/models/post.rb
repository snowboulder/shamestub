class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { maximum: 50 }
  validates :story, presence: true, length: { maximum: 2500 }
end
