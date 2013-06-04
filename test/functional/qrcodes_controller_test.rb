require 'test_helper'

class QrcodesControllerTest < ActionController::TestCase
  setup do
    @qrcode = qrcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qrcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qrcode" do
    assert_difference('Qrcode.count') do
      post :create, qrcode: { Answer2: @qrcode.Answer2, Answer3: @qrcode.Answer3, Answer4: @qrcode.Answer4, Long: @qrcode.Long, SAnswer: @qrcode.SAnswer, hash: @qrcode.hash, lat: @qrcode.lat, name: @qrcode.name, question: @qrcode.question }
    end

    assert_redirected_to qrcode_path(assigns(:qrcode))
  end

  test "should show qrcode" do
    get :show, id: @qrcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qrcode
    assert_response :success
  end

  test "should update qrcode" do
    put :update, id: @qrcode, qrcode: { Answer2: @qrcode.Answer2, Answer3: @qrcode.Answer3, Answer4: @qrcode.Answer4, Long: @qrcode.Long, SAnswer: @qrcode.SAnswer, hash: @qrcode.hash, lat: @qrcode.lat, name: @qrcode.name, question: @qrcode.question }
    assert_redirected_to qrcode_path(assigns(:qrcode))
  end

  test "should destroy qrcode" do
    assert_difference('Qrcode.count', -1) do
      delete :destroy, id: @qrcode
    end

    assert_redirected_to qrcodes_path
  end
end
