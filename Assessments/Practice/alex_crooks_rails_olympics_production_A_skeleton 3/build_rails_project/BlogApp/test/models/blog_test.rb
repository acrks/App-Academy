# == Schema Information
#
# Table name: blogs
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  body      :text             not null
#  author_id :integer          not null
#
require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
