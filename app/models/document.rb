class Document < ApplicationRecord
  belongs_to :site
  belongs_to :user
  has_many :attachments
  has_many :taggings
  has_many :tags, through: :taggings

  KINDS = ['page', 'article', 'recipe', 'resource']

  validates :title, :slug, presence: true
  validates  :slug, uniqueness: true
  validates  :kind, inclusion: {in: KINDS}

  validates :slug, format: {
    with: /\A[a-z1-9\-]+\z/,
    message: "debe tener sólo letras minúsculas, números y guiónes del medio."
  }

  validates_property :format,
    of: :photo,
    in: ['jpeg', 'png', 'gif']

  scope :is_public, -> {where(:public => true)
    .order('publication_date DESC')}

  def to_param
    slug
  end

  def destroy
    super unless protected?
  end

  dragonfly_accessor 'photo' do
    storage_options do |f|
      { path: File.join('page', id.to_s,
        "photo-#{rand(10000)}.#{f.format}") }
    end
  end

end