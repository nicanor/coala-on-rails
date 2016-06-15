class Public::ArticlesController < Public::PublicController

  def index
    @articles = public_articles
  end

  def show
    @article = public_articles
      .find_by(slug: params[:id])

    @prev = public_articles.where(
      "publication_date < ?",
      @article.publication_date
    ).first

    @next = public_articles.where(
      "publication_date > ?",
      @article.publication_date
    ).last
  end

end