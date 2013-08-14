class Status < ActiveRecord::Base
	belongs_to :user


	validates :supplication, presence: true,
							 length: { minimum: 2 }

	validates :user_id, presence: true
end





