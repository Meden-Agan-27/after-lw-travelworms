require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "tag model exists" do
    tag = Tag.new
    assert_equal false, tag.nil?
  end

  test "tag name should not be blank" do
    tag = Tag.new
    assert_equal false, tag.valid?
  end

  test "tag can be created in DB" do
    tag = Tag.create(tag_name: "Made me cry")
    assert_equal "Made me cry", Tag.last.tag_name
      end

  test "tag_name must to be unique and case insensitive" do
    tag1 = Tag.create(tag_name: "Hello")
    tag2 = Tag.new(tag_name: "Hello")
    tag3 = Tag.new(tag_name: "helLO")
    assert_equal false, tag2.valid? && tag3.valid?
  end

  test "a book can have a tag" do
    book = Book.new
    tag = Tag.new(tag_name: "Made me cry")
    assert_equal false, book.tags.nil?
  end

  # We were here
  test "a book can have several unique tags" do
    book = Book.new
    tag = Tag.create(tag_name: "Made me cry")
    tag2 = Tag.create(tag_name: "Made me laugh")
    book.tags = tag
    book.tags = tag2
    assert_equal 2, book.tags.count

  end

  test "a tag can be attached to different books" do
  end

  test "user can attached several unique tags to a book" do
  end

end
