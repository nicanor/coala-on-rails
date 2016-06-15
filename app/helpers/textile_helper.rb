module TextileHelper

  def compile_textile(raw_text)
    #textilize(
    #  compile_images(raw_text)
    #).html_safe
    Kramdown::Document.new(
      compile_images(raw_text)
    ).to_html.html_safe
  end

  # [img:my_image:'100x100'] =>
  #   "http://domain.com/images/..."
  def compile_images(content)
    content.gsub(/\[img:(.*):'(.*)'\]/) do
      get_image(slug: $1, size: $2)
    end
  end

  def get_image(slug:, size:)
    Attachment.find_by(slug: slug)
      .file.thumb(size).url
  rescue ActiveRecord::RecordNotFound
    '<!-- ActiveRecord::RecordNotFound -->'
  rescue NoMethodError
    '<!-- NoMethodError -->'
  end

end