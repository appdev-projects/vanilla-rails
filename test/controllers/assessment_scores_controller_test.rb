require "test_helper"

class AssessmentScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment_score = assessment_scores(:one)
  end

  test "should get index" do
    get assessment_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_score_url
    assert_response :success
  end

  test "should create assessment_score" do
    assert_difference('AssessmentScore.count') do
      post assessment_scores_url, params: { assessment_score: { communalist: @assessment_score.communalist, environmentalist: @assessment_score.environmentalist, personalist: @assessment_score.personalist, seeker_id: @assessment_score.seeker_id, spiritual_type: @assessment_score.spiritual_type, transcendentalist: @assessment_score.transcendentalist } }
    end

    assert_redirected_to assessment_score_url(AssessmentScore.last)
  end

  test "should show assessment_score" do
    get assessment_score_url(@assessment_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_score_url(@assessment_score)
    assert_response :success
  end

  test "should update assessment_score" do
    patch assessment_score_url(@assessment_score), params: { assessment_score: { communalist: @assessment_score.communalist, environmentalist: @assessment_score.environmentalist, personalist: @assessment_score.personalist, seeker_id: @assessment_score.seeker_id, spiritual_type: @assessment_score.spiritual_type, transcendentalist: @assessment_score.transcendentalist } }
    assert_redirected_to assessment_score_url(@assessment_score)
  end

  test "should destroy assessment_score" do
    assert_difference('AssessmentScore.count', -1) do
      delete assessment_score_url(@assessment_score)
    end

    assert_redirected_to assessment_scores_url
  end
end
