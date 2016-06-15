class Attachment < ApplicationRecord

  belongs_to :document

  validates :title,
            :slug, presence: true

  validates :slug, uniqueness: true

  validates :file,
    presence: true,
    on: :create

  def to_param
    slug
  end

  dragonfly_accessor 'file' do
    storage_options do |f|
      { path: File.join('attachment', id.to_s,
        "file-#{rand(10000)}.#{f.format}") }
    end
  end

  delegate :width,
           :height,
           :size,
           :format,
           :mime_type, to: :file
end