class Noun < ApplicationRecord
  has_many :noun_rows, dependent: :destroy
end
