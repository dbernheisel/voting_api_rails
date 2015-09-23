class VotersController < ApplicationController
  def show
    render json: Voter.all.to_json
  end

  def create
  end

  def update
  end

end
