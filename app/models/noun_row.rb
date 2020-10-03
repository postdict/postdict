class NounRow < ApplicationRecord
  belongs_to :nouns, optional: true 
end
