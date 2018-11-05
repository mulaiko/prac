class Post < ApplicationRecord
	default_scope { order(created_at: :desc) }
	belongs_to :user

	validates :content, presence: true

	after_create_commit { PostBroadcastJob.perform_now self.user, self }
end