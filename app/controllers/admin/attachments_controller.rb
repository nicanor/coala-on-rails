class Admin::AttachmentsController < Admin::AdminController
  before_action :set_document
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = @document.attachments.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to [@document, @attachment], notice: 'El archivo fue creado con éxito.' }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to [@document, @attachment], notice: 'El archivo fue actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to document_path(@document, anchor: 'attachments'), notice: 'El archivo fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = Attachment.find_by(slug: params[:id])
  end

  def set_document
    @document = Document.find_by(slug: params[:document_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attachment_params
    hack = params.require(:attachment).permit(
      :title,
      :slug,
      :description,
      :file,
      :remove_file,
      :document_id
    )

    if hack[:file].blank?
      hack.except(:file)
    else
      hack
    end
  end
end
