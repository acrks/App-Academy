# == Schema Information
#
# Table name: comments
#
#  id        :bigint           not null, primary key
#  body      :string           not null
#  author_id :integer          not null
#  blog_id   :integer          not null
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
