class CandidatesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: Candidate.all.to_json }
      format.yaml { render text: Candidate.all.to_yaml, content_type: 'text/yaml' }
      format.xml { render xml: Candidate.all.to_xml }
    end
  end

  def show
    begin
      respond_to do |format|
        format.html
        format.json { render json: Candidate.find(params[:id]).to_json }
        format.yaml { render text: Candidate.find(params[:id]).to_yaml, content_type: 'text/yaml' }
        format.xml  { render xml: Candidate.find(params[:id]).to_xml }
      end
    rescue
      render json: {Error: "Candidate not found"}
    end
  end
end
