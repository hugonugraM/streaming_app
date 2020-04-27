class ContentsController < ApplicationController
  # GET /contents
  def index
    @contents = Content.all

    render json: @contents
  end

  # GET /contents/movies
  def movies
    @contents = Content.movies

    render json: @contents
  end

  # GET /contents/seasons
  def seasons
    @contents = Content.seasons

    render json: @contents.to_json(include: :episodes)
  end
end
