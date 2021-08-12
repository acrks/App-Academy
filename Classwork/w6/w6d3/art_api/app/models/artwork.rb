# frozen_string_literal: true

# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord
  validates :image_url, uniqueness: true, presence: true
  validates :title, uniqueness: { scope: :artist_id }, presence: true

  belongs_to :artist,
             foreign_key: :artist_id,
             class_name: :User

  has_many :views,
           foreign_key: :artwork_id,
           class_name: :ArtworkShare

  has_many :shared_viewers,
           through: :views,
           source: :viewer
end
