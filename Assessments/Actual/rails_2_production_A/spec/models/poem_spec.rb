# == Schema Information
#
# Table name: poems
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  stanzas    :string           not null
#  complete   :boolean          not null
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Poem, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:stanzas) }
  it { should allow_value(true, false).for(:complete) }
  it { should belong_to(:author) }
end
