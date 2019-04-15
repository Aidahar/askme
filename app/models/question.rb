class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :author, class_name: "User", foreign_key: "author_id" 

  validates :text, :user, presence: true, length: { maximum: 255 }
end
