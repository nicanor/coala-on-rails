class Public::ResourcesController < Public::PublicController

  def index
    @resources = public_resources
  end

  def show
    @resource = get_resource
  end

  def download
    resource = get_resource
    send_data(
      resource.photo.file.read,
      type: resource.photo.mime_type,
      disposition: 'inline'
    )
  end

  private

  def get_resource
    public_resources
      .find_by(slug: params[:id])
  end

end