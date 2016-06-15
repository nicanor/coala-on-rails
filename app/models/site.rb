class Site < ApplicationRecord
  has_many :documents

  validates :code, :name, :description,
    presence: true
  validates :code, uniqueness: true

  def pages
    documents.where(kind: :page)
  end

  def articles
    documents.where(kind: :article)
  end

  def recipes
    documents.where(kind: :recipe)
  end

  def resources
    documents.where(kind: :resource)
  end

end