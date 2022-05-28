require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "creating a Game" do
    visit games_url
    click_on "New Game"

    fill_in "Blackteamcolor", with: @game.blackteamcolor
    fill_in "Boardsetup", with: @game.boardsetup
    fill_in "Moves", with: @game.moves
    fill_in "Outcome", with: @game.outcome
    fill_in "Status", with: @game.status
    fill_in "Whiteteamcolor", with: @game.whiteteamcolor
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "updating a Game" do
    visit games_url
    click_on "Edit", match: :first

    fill_in "Blackteamcolor", with: @game.blackteamcolor
    fill_in "Boardsetup", with: @game.boardsetup
    fill_in "Moves", with: @game.moves
    fill_in "Outcome", with: @game.outcome
    fill_in "Status", with: @game.status
    fill_in "Whiteteamcolor", with: @game.whiteteamcolor
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "destroying a Game" do
    visit games_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game was successfully destroyed"
  end
end
