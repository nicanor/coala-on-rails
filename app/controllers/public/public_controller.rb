class Public::PublicController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound,
    with: :not_found_handler

  def home
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