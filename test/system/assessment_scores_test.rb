require "application_system_test_case"

class AssessmentScoresTest < ApplicationSystemTestCase
  setup do
    @assessment_score = assessment_scores(:one)
  end

  test "visiting the index" do
    visit assessment_scores_url
    assert_selector "h1", text: "Assessment Scores"
  end

  test "creating a Assessment score" do
    visit assessment_scores_url
    click_on "New Assessment Score"

    fill_in "Communalist", with: @assessment_score.communalist
    fill_in "Environmentalist", with: @assessment_score.environmentalist
    fill_in "Personalist", with: @assessment_score.personalist
    fill_in "Seeker", with: @assessment_score.seeker_id
    fill_in "Spiritual type", with: @assessment_score.spiritual_type
    fill_in "Transcendentalist", with: @assessment_score.transcendentalist
    click_on "Create Assessment score"

    assert_text "Assessment score was successfully created"
    click_on "Back"
  end

  test "updating a Assessment score" do
    visit assessment_scores_url
    click_on "Edit", match: :first

    fill_in "Communalist", with: @assessment_score.communalist
    fill_in "Environmentalist", with: @assessment_score.environmentalist
    fill_in "Personalist", with: @assessment_score.personalist
    fill_in "Seeker", with: @assessment_score.seeker_id
    fill_in "Spiritual type", with: @assessment_score.spiritual_type
    fill_in "Transcendentalist", with: @assessment_score.transcendentalist
    click_on "Update Assessment score"

    assert_text "Assessment score was successfully updated"
    click_on "Back"
  end

  test "destroying a Assessment score" do
    visit assessment_scores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assessment score was successfully destroyed"
  end
end
