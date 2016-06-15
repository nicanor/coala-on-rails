class Admin::DocumentsController < Admin::AdminController
  before_action :set_document, only: [:show, :edit, :update, :destroy, :image]

  # GET /documents
  # GET /documents.json
  def index
    @filter = DocumentFilter.new(filter_params)
    @documents = @filter.call.page(params[:page])
  end

  def image
    send_data(
      @document.photo.file.read,
      type: @document.photo.mime_type,
      disposition: 'inline'
    )
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, success: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, success: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url(document_filter: {kind: @document.kind}), success: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find_by(slug: params[:id])
  end

  def filter_params
    if params[:document_filter]
      params
        .require(:document_filter)
        .permit(:kind, :title)
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    hack = params.require(:document).permit(
      :title,
      :slug,
      :kind,
      :description,
      :content,
      :public,
      :protected,
      :publication_date,
      :facebook_url,
      :photo,
      :remove_photo,
      :site_id
    )

    if hack[:photo].blank?
      hack.except(:photo)
    else
      hack
    end
  end
end
