class Public::PublicController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound,
    with: :not_found_handler

  def home
    @important_pages    = public_articles.first(3)
    @important_articles = public_articles.last(4)
    @important_recipes  = public_recipes.last(4)
  end

  def not_found
  end

  private

  def not_found_handler
    render :not_found,
      status: 404
  end

  def public_articles
    site.articles.is_public
  end

  def public_pages
    site.pages.is_public
  end

  def public_resources
    site.resources.is_public
  end

  def public_recipes
    site.recipes.is_public
  end

end