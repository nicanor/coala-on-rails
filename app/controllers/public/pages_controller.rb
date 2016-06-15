class Public::PagesController < Public::PublicController

  def show
    @page = public_pages
      .find_by!(slug: params[:id])
  end

end