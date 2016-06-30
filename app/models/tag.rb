class Tag < ApplicationRecord
  has_many :taggings
  has_many :documents, through: :taggings

  validates :name, :slug, presence: true

  def to_param
    slug
  end
end