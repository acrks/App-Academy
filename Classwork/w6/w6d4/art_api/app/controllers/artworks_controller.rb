# frozen_string_literal: true

class ArtworksController < ApplicationController
  def index
    user_id = params[:user_id]
    artworks = []
    artworks << Artwork.find_by(artist_id: user_id)
    # Pass that method to each element of the array (artwork_shares)
    artworks += User.find_by(id: user_id).artwork_shares.map(&:artwork)
    render json: artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork
    else
      render json: { error: 'There is no artwork with that id.' }, status: 404
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork.nil?
      render json: { error: 'There is no artwork with that id.' }, status: 404
      return
    end

    if artwork.update(artwork_params)
      redirect_to artwork_url(artwork)
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.destroy
      redirect_to artwork_url
    else
      render json: { error: 'There is no artwork with that id.' }, status: 404
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
