require "application_system_test_case"

class TagsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"

    assert_selector "h1", text: "Welcome to TravelWorms!"
  end

  # test "user can attached several unique tags to a book" do
    # book = Book.new
    # tag1 = Tag.create(tag_name: "Made me smile")
    # tag2 = Tag.create(tag_name: "Made me cry")
  # end
end
