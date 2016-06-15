require 'test_helper'

class AttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attachment = attachments(:one)
  end

  test "should get index" do
    get attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_attachment_url
    assert_response :success
  end

  test "should create attachment" do
    assert_difference('Attachment.count') do
      post attachments_url, params: { attachment: { description: @attachment.description, file_name: @attachment.file_name, file_uid: @attachment.file_uid, slug: @attachment.slug, title: @attachment.title } }
    end

    assert_redirected_to attachment_path(Attachment.last)
  end

  test "should show attachment" do
    get attachment_url(@attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_attachment_url(@attachment)
    assert_response :success
  end

  test "should update attachment" do
    patch attachment_url(@attachment), params: { attachment: { description: @attachment.description, file_name: @attachment.file_name, file_uid: @attachment.file_uid, slug: @attachment.slug, title: @attachment.title } }
    assert_redirected_to attachment_path(@attachment)
  end

  test "should destroy attachment" do
    assert_difference('Attachment.count', -1) do
      delete attachment_url(@attachment)
    end

    assert_redirected_to attachments_path
  end
end
