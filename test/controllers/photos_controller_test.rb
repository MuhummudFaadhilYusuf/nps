require "test_helper"

class PhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo = photos(:one)
  end

  test "should get index" do
    get photos_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_url
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post photos_url, params: { photo: { title: 'test', image: fixture_file_upload("leftbrain-rightbrain.jpeg", "image/jpeg") } }
    end

    assert_redirected_to photo_url(Photo.last)
    # byebug

    assert_equal "leftbrain-rightbrain.jpeg", Photo.last.image.filename.to_s
  end

  test "should show photo" do
    # byebug
    get photo_url(@photo)
    assert_response :success

    assert_select "img" do
      assert_select "[src=?]", url_for(@photo.image.variant(resize: "100x100"))
    end
  end

  test "should get edit" do
    get edit_photo_url(@photo)
    assert_response :success
  end

  test "should update photo" do
    patch photo_url(@photo), params: { photo: { title: 'test', image: fixture_file_upload("leftbrain-rightbrain.jpeg", "image/jpeg") } }
    assert_redirected_to photo_url(@photo)
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete photo_url(@photo)
    end

    assert_redirected_to photos_url
  end
end
