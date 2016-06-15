require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get documents_url
    assert_response :success
  end

  test "should get new" do
    get new_document_url
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post documents_url, params: { document: { content: @document.content, description: @document.description, facebook_url: @document.facebook_url, kind: @document.kind, photo_name: @document.photo_name, photo_uid: @document.photo_uid, protected: @document.protected, public: @document.public, publication_date: @document.publication_date, site_id: @document.site_id, slug: @document.slug, title: @document.title } }
    end

    assert_redirected_to document_path(Document.last)
  end

  test "should show document" do
    get document_url(@document)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_url(@document)
    assert_response :success
  end

  test "should update document" do
    patch document_url(@document), params: { document: { content: @document.content, description: @document.description, facebook_url: @document.facebook_url, kind: @document.kind, photo_name: @document.photo_name, photo_uid: @document.photo_uid, protected: @document.protected, public: @document.public, publication_date: @document.publication_date, site_id: @document.site_id, slug: @document.slug, title: @document.title } }
    assert_redirected_to document_path(@document)
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete document_url(@document)
    end

    assert_redirected_to documents_path
  end
end
