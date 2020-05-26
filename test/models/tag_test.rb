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
    book.tags << tag
    book.tags << tag2
    assert_equal 2, book.tags.length

  end

  test "a tag can be attached to different books" do
    book1 = Book.create(title: "I don't like books", country: "Germany", language: "Gaelic", author: "me", genre: "Fiction")
    book2 = Book.create(title: "I like books", country: "France", language: "French", author: "you", genre: "Non-Fiction")
    tag = Tag.create(tag_name: "Made me smile")
    booktag = BookTag.create(book: book1, tag: tag)
    booktag = BookTag.create(book: book2, tag: tag)
    assert_equal true, book1.tags[0].id == book2.tags[0].id
  end

  test "a tag can be removed from a book without being destroyed" do
    book1 = Book.create(title: "I don't like books", country: "Germany", language: "Gaelic", author: "me", genre: "Fiction")
    tag1 = Tag.create(tag_name: "Made me smile")
    booktag = BookTag.create(book: book1, tag: tag1)
    booktag.destroy
    assert_equal true, book1.tags.empty? && !tag1.nil?
  end
end
