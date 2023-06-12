require "test_helper"

class AssessmentQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment_question = assessment_questions(:one)
  end

  test "should get index" do
    get assessment_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_question_url
    assert_response :success
  end

  test "should create assessment_question" do
    assert_difference('AssessmentQuestion.count') do
      post assessment_questions_url, params: { assessment_question: { assessment: @assessment_question.assessment, name: @assessment_question.name, number_string: @assessment_question.number_string, question: @assessment_question.question, spiritual_type: @assessment_question.spiritual_type, string: @assessment_question.string } }
    end

    assert_redirected_to assessment_question_url(AssessmentQuestion.last)
  end

  test "should show assessment_question" do
    get assessment_question_url(@assessment_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_question_url(@assessment_question)
    assert_response :success
  end

  test "should update assessment_question" do
    patch assessment_question_url(@assessment_question), params: { assessment_question: { assessment: @assessment_question.assessment, name: @assessment_question.name, number_string: @assessment_question.number_string, question: @assessment_question.question, spiritual_type: @assessment_question.spiritual_type, string: @assessment_question.string } }
    assert_redirected_to assessment_question_url(@assessment_question)
  end

  test "should destroy assessment_question" do
    assert_difference('AssessmentQuestion.count', -1) do
      delete assessment_question_url(@assessment_question)
    end

    assert_redirected_to assessment_questions_url
  end
end
