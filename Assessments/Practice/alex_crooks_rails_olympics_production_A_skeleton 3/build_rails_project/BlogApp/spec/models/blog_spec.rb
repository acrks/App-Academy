# == Schema Information
#
# Table name: blogs
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  body      :text             not null
#  author_id :integer          not null
#
require 'rails_helper'

RSpec.describe Blog, type: :model do
  let (:user) { User.create(email: "bloggerboi@fakeblog.com") }
  subject { Blog.create(title: "Let me tell you about that one time", body: "It was cool", author_id: user.id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_uniqueness_of(:title).scoped_to(:author_id) }
  it { should belong_to(:author).class_name(:User) }
  it { should have_many(:comments).class_name(:Comment).dependent(:destroy)  }
end
