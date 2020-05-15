require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "tag model exists" do
    tag = Tag.new
    assert_equal !nil, tag
  end
end
