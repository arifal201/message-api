class Message < ApplicationRecord
  belongs_to :conversation
  delegate :messages, to: :conversation

  attribute :sender_id
  attribute :recipient_id
  attribute :content
  attribute :conversation_id
end
