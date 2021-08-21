# == Schema Information
#
# Table name: users
#
#  id    :bigint           not null, primary key
#  email :string           not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject{ User.create(email: "bloggerboi@fakeblog.com") }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_many(:blogs).class_name(:Blog)}
  it { should have_many(:comments).class_name(:Comment)}
  it { should have_many(:comments_on_blogs).through(:blogs).source(:comments) }
  it { should have_many(:blogs_commented_on).through(:comments).source(:blog) }
end
