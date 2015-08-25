require 'test_helper'

class TrainingSessionsControllerTest < ActionController::TestCase
  setup do
    @training_session = training_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_session" do
    assert_difference('TrainingSession.count') do
      post :create, training_session: { committee: @training_session.committee, date: @training_session.date, description: @training_session.description, end_time: @training_session.end_time, image_url: @training_session.image_url, is_active: @training_session.is_active, page_description: @training_session.page_description, start_time: @training_session.start_time, subheading: @training_session.subheading, topic: @training_session.topic, topic_guide_url: @training_session.topic_guide_url }
    end

    assert_redirected_to training_session_path(assigns(:training_session))
  end

  test "should show training_session" do
    get :show, id: @training_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training_session
    assert_response :success
  end

  test "should update training_session" do
    patch :update, id: @training_session, training_session: { committee: @training_session.committee, date: @training_session.date, description: @training_session.description, end_time: @training_session.end_time, image_url: @training_session.image_url, is_active: @training_session.is_active, page_description: @training_session.page_description, start_time: @training_session.start_time, subheading: @training_session.subheading, topic: @training_session.topic, topic_guide_url: @training_session.topic_guide_url }
    assert_redirected_to training_session_path(assigns(:training_session))
  end

  test "should destroy training_session" do
    assert_difference('TrainingSession.count', -1) do
      delete :destroy, id: @training_session
    end

    assert_redirected_to training_sessions_path
  end
end
