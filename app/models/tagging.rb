class Tagging < ApplicationRecord
  belongs_to :document
  belongs_to :tag
end
