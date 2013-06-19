class Message < ActiveRecord::Base
  attr_accessible :msg_text, :msg_type, :shared_on, :user_id
end
