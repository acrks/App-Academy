# frozen_string_literal: true

# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness: { scope: :viewer_id }, presence: true
  validates :viewer_id, presence: true

  belongs_to :viewer,
             foreign_key: :viewer_id,
             class_name: :User

  belongs_to :artwork,
             foreign_key: :artwork_id,
             class_name: :Artwork
end
