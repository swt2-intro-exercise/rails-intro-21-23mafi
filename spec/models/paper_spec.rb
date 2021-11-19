require 'rails_helper'

RSpec.describe Paper, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
    it "should get an empty list of authors" do
      paper = Paper.new()
      assert_equal([], paper.authors, 'list not empty')
    end

end
