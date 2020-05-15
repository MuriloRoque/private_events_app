class User < ApplicationRecord
    has_many :event, foreign_key: :creator_id
end
