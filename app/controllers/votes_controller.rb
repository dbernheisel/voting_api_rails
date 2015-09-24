class VotesController < ApplicationController

  def create
    voter = Voter.find(params[:voter_id])
    authenticate(voter.token)

    e = Vote.new(voter_id: params[:voter_id], candidate: params[:candidate_id])
    if e.save
      render json: e.to_json, status: 201
    else
      render json: e.errors, status: 400
    end
  end

  def destroy
    voter = Voter.find(params[:voter_id])
    authenticate(voter.token)

    voter.destroy
    if voter.destroy
      render json: {Success: true}, status: 200
    else
      render json: voter.errors, status: 400
    end
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: Vote.all.to_json, status: 200 }
      format.xml { render json: Vote.all.to_xml, status: 200 }
      format.yaml { render text: Vote.all.to_yaml, content_type: 'text/yaml', status: 200 }
    end
  end

  def show
    begin
      respond_to do |format|
        format.html
        format.json { render json: Vote.find(params[:id]).to_json, status: 200 }
        format.yaml { render text: Vote.find(params[:id]).to_yaml, content_type: 'text/yaml', status: 200 }
        format.xml  { render xml: Vote.find(params[:id]).to_xml, status: 200 }
      end
    rescue
      render json: {Error: "Vote not found"}, status: 404
    end
  end
end
