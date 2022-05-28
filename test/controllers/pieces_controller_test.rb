require "test_helper"

class PiecesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piece = pieces(:one)
  end

  test "should get index" do
    get pieces_url
    assert_response :success
  end

  test "should get new" do
    get new_piece_url
    assert_response :success
  end

  test "should create piece" do
    assert_difference('Piece.count') do
      post pieces_url, params: { piece: { pieceowner_id: @piece.pieceowner_id, piecetype: @piece.piecetype, points: @piece.points, teamcolor: @piece.teamcolor } }
    end

    assert_redirected_to piece_url(Piece.last)
  end

  test "should show piece" do
    get piece_url(@piece)
    assert_response :success
  end

  test "should get edit" do
    get edit_piece_url(@piece)
    assert_response :success
  end

  test "should update piece" do
    patch piece_url(@piece), params: { piece: { pieceowner_id: @piece.pieceowner_id, piecetype: @piece.piecetype, points: @piece.points, teamcolor: @piece.teamcolor } }
    assert_redirected_to piece_url(@piece)
  end

  test "should destroy piece" do
    assert_difference('Piece.count', -1) do
      delete piece_url(@piece)
    end

    assert_redirected_to pieces_url
  end
end
