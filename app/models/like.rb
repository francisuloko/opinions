class Like < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :user_id, uniqueness: { scope: :opinion_id }
end
