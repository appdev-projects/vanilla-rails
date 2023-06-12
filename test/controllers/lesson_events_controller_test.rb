require "test_helper"

class LessonEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_event = lesson_events(:one)
  end

  test "should get index" do
    get lesson_events_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_event_url
    assert_response :success
  end

  test "should create lesson_event" do
    assert_difference('LessonEvent.count') do
      post lesson_events_url, params: { lesson_event: { lesson_id: @lesson_event.lesson_id, seeker_id: @lesson_event.seeker_id, status: @lesson_event.status } }
    end

    assert_redirected_to lesson_event_url(LessonEvent.last)
  end

  test "should show lesson_event" do
    get lesson_event_url(@lesson_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_event_url(@lesson_event)
    assert_response :success
  end

  test "should update lesson_event" do
    patch lesson_event_url(@lesson_event), params: { lesson_event: { lesson_id: @lesson_event.lesson_id, seeker_id: @lesson_event.seeker_id, status: @lesson_event.status } }
    assert_redirected_to lesson_event_url(@lesson_event)
  end

  test "should destroy lesson_event" do
    assert_difference('LessonEvent.count', -1) do
      delete lesson_event_url(@lesson_event)
    end

    assert_redirected_to lesson_events_url
  end
end
