class DocumentFilter
  include ActiveModel::Model

  attr_accessor :kind, :title

  def call
    if not Document::KINDS.include?(kind)
      self.kind = 'page'
    end

    documents = Document.where(kind: kind)
    documents = documents.where('title ilike ?', "%#{title}%") if title
    documents
  end
end