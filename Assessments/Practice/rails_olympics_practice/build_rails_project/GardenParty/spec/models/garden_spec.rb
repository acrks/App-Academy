# == Schema Information
#
# Table name: gardens
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  size            :integer          not null
#  garden_owner_id :integer          not null
#
require 'rails_helper'

RSpec.describe Garden, type: :model do
  let (:user) { User.create(username: "AppleSauce") }
  subject { Garden.create(name: "The Oasis", size: 1000, garden_owner_id: user.id) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:garden_owner_id) }
  it { should validate_presence_of(:size) }
  it { should belong_to(:garden_owner).class_name(:User) }
  it { should have_many(:flowers).class_name(:Flower) }
end
