module ApplicationHelper

  def flash_messages
    capture do
      flash.map do |type, msj|
        concat(flash_message(type, msj))
      end
    end
  end

  def kind_options
    Document::KINDS.map do |kind|
      [I18n.t(kind), kind]
    end
  end

  def role_options
    User::ROLES.map do |role|
      [I18n.t(role), role]
    end
  end

  private

  def flash_message(type, message)
    klass = "alert alert-#{type}"

    flash.discard(type)

    content_tag :article, class: klass do
      concat close_link
      concat message
    end
  end

  def close_link
    link_to('×', '',
      class: :close,
      data: { dismiss: :alert }
    )
  end

  def pages_info
    site.pages.is_public.pluck(:slug, :title)
  end

  def articles_info
    site.articles.is_public.pluck(:slug, :title)
  end

  def sitemap
    site.documents.is_public
      .pluck(:kind, :slug, :title)
      .group_by {|x| x.first}
  end

  def public_path(document)
    case document.kind.to_sym
      when :page     then page_path(document)
      when :article  then article_path(document)
      when :recipe   then recipe_path(document)
      when :resource then resource_path(document)
      else root_path
    end
  end

  # Usage: octicon(:home, width: 16, height: 16)
  def octicon(name, options)
    content_tag :svg, options do
      content_tag :use, '', 'xlink:href' => "#icon-#{name}"
    end
  end

end