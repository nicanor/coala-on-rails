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

end