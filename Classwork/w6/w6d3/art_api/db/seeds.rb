# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

ry = User.create(username: 'ry101')
al = User.create(username: 'al101')
mona_lisa = Artwork.create(title: 'Mona Lisa', image_url: 'monalisa.com', artist_id: ry.id)
starry_night = Artwork.create(title: 'Starry Night', image_url: 'sn.com', artist_id: ry.id)
last_supper = Artwork.create(title: 'Last Supper', image_url: 'lastsupper.com', artist_id: al.id)
view_1 = ArtworkShare.create(artwork_id: mona_lisa.id, viewer_id: al.id)
view_2 = ArtworkShare.create(artwork_id: mona_lisa.id, viewer_id: ry.id)
# view_3 = ArtworkShare.create(artwork_id: 1, viewer_id: 1)
view_4 = ArtworkShare.create(artwork_id: last_supper.id, viewer_id: ry.id)
view_5 = ArtworkShare.create(artwork_id: last_supper.id, viewer_id: al.id)
