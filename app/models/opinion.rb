class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy

  validates :text, presence: true, length: {minimum: 2, maximum: 140}
end
