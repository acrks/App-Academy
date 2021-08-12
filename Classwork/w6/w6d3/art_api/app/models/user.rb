# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
           foreign_key: :artist_id,
           class_name: :Artwork,
           dependent: :destroy

  has_many :views,
           foreign_key: :viewer_id,
           class_name: :ArtworkShare

  has_many :artwork_shares,
           through: :views,
           source: :artwork,
           dependent: :destroy
end
