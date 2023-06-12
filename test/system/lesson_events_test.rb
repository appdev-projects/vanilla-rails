require "application_system_test_case"

class LessonEventsTest < ApplicationSystemTestCase
  setup do
    @lesson_event = lesson_events(:one)
  end

  test "visiting the index" do
    visit lesson_events_url
    assert_selector "h1", text: "Lesson Events"
  end

  test "creating a Lesson event" do
    visit lesson_events_url
    click_on "New Lesson Event"

    fill_in "Lesson", with: @lesson_event.lesson_id
    fill_in "Seeker", with: @lesson_event.seeker_id
    fill_in "Status", with: @lesson_event.status
    click_on "Create Lesson event"

    assert_text "Lesson event was successfully created"
    click_on "Back"
  end

  test "updating a Lesson event" do
    visit lesson_events_url
    click_on "Edit", match: :first

    fill_in "Lesson", with: @lesson_event.lesson_id
    fill_in "Seeker", with: @lesson_event.seeker_id
    fill_in "Status", with: @lesson_event.status
    click_on "Update Lesson event"

    assert_text "Lesson event was successfully updated"
    click_on "Back"
  end

  test "destroying a Lesson event" do
    visit lesson_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lesson event was successfully destroyed"
  end
end
