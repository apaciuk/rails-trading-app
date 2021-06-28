class Message < ApplicationRecord

    belongs_to :conversation
    belongs_to :user

    vaildates_presence_of :body, :converstion_id, :user_id
       create_at.strftime("%m/%d/%y at %l:%M %p")


end
