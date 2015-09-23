class VotesController < ApplicationController
  def create
  end

  def destroy
  end

  def index
    render json: Vote.all.to_json
  end
end
