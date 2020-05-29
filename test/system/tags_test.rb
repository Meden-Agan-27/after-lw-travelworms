require "application_system_test_case"

class TagsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"

    assert_selector "h1", text: "Welcome to TravelWorms!"
  end

  test "user can attached a tag to a book" do
    # setup
    login_as users(:yves)
    visit "/books/1"
    # exercise
    click_on "Add tag"
    check("Good")
    click_on "Save Tag"
    # save_and_open_screenshot
    # verify
    assert_selector ".tag", text: "Good"
    assert_selector ".tag", count: Book.last.tags.count
    # teardown
  end
end
