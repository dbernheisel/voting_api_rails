class VotesController < ApplicationController
  def create
    e = Vote.new(voter_id: params[:voter_id], candidate: params[:candidate_id])
    if e.save
      render json: e.to_json, status: 200
    else
      render json: e.errors
    end
  end

  def destroy
    v = Vote.find(params[:id]).destroy
    if v.destroy
      render json: {Success: true}, status: 200
    else
      render json: v.errors
    end
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: Vote.all.to_json }
      format.xml { render json: Vote.all.to_xml }
      format.yaml { render text: Vote.all.to_yaml, content_type: 'text/yaml' }
    end
  end

  def show
    begin
      respond_to do |format|
        format.html
        format.json { render json: Vote.find(params[:id]).to_json }
        format.yaml { render text: Vote.find(params[:id]).to_yaml, content_type: 'text/yaml' }
        format.xml  { render xml: Vote.find(params[:id]).to_xml }
      end
    rescue
      render json: {Error: "Vote not found"}
    end
  end
end
