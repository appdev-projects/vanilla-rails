require "application_system_test_case"

class AssessmentQuestionsTest < ApplicationSystemTestCase
  setup do
    @assessment_question = assessment_questions(:one)
  end

  test "visiting the index" do
    visit assessment_questions_url
    assert_selector "h1", text: "Assessment Questions"
  end

  test "creating a Assessment question" do
    visit assessment_questions_url
    click_on "New Assessment Question"

    fill_in "Assessment", with: @assessment_question.assessment
    fill_in "Name", with: @assessment_question.name
    fill_in "Number string", with: @assessment_question.number_string
    fill_in "Question", with: @assessment_question.question
    fill_in "Spiritual type", with: @assessment_question.spiritual_type
    fill_in "String", with: @assessment_question.string
    click_on "Create Assessment question"

    assert_text "Assessment question was successfully created"
    click_on "Back"
  end

  test "updating a Assessment question" do
    visit assessment_questions_url
    click_on "Edit", match: :first

    fill_in "Assessment", with: @assessment_question.assessment
    fill_in "Name", with: @assessment_question.name
    fill_in "Number string", with: @assessment_question.number_string
    fill_in "Question", with: @assessment_question.question
    fill_in "Spiritual type", with: @assessment_question.spiritual_type
    fill_in "String", with: @assessment_question.string
    click_on "Update Assessment question"

    assert_text "Assessment question was successfully updated"
    click_on "Back"
  end

  test "destroying a Assessment question" do
    visit assessment_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assessment question was successfully destroyed"
  end
end
