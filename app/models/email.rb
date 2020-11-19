class Email < ApplicationRecord
  validates :object,
    presence: true
  validates :body,
    presence: true
end
