class User < ApplicationRecord
  has_many :opinions, foreign_key: :author_id, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :request_connections, class_name: 'Following', foreign_key: 'follower_id'
  has_many :following, through: :request_connections, source: 'followed'
  has_many :connection_requests, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :connection_requests

  has_one_attached :photo
  has_one_attached :cover_image

  validates :fullname, presence: { message: 'Name cannot be blank' }, length: { minimum: 2, maximum: 25 }
  validates :username, presence: { message: 'Username cannot be blank' }, length: { minimum: 2, maximum: 25 }

  def who_to_follow
    User.all.where.not(id: following).where('id != ?', id).order('created_at DESC')
  end

  private

  def photo_upload
    error.add(:photo, 'is too large') unless photo.byte_size <= 2.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:photo_upload, 'must be a JPEG or PNG') unless acceptable_types.include?(main_image.content_type)
  end

  def cover_upload
    error.add(:photo, 'is too large') unless photo.byte_size <= 2.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:photo_upload, 'must be a JPEG or PNG') unless acceptable_types.include?(main_image.content_type)
  end
end
