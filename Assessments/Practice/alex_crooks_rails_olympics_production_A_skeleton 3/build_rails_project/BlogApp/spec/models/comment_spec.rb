# == Schema Information
#
# Table name: comments
#
#  id        :bigint           not null, primary key
#  body      :string           not null
#  author_id :integer          not null
#  blog_id   :integer          not null
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:body) }
  it { should belong_to(:author).class_name(:User) }
  it { should belong_to(:blog).class_name(:Blog) }
end
