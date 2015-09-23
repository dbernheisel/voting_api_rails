class VotersController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.json { render json: Voter.find(params[:id]).to_json, status: 200 }
      format.yaml { render text: Voter.find(params[:id]).to_yaml, content_type: 'text/yaml', status: 200 }
      format.xml  { render xml: Voter.find(params[:id]).to_xml, status: 200 }
    end
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: Voter.all.to_json, status: 200 }
      format.yaml { render text: Voter.all.to_yaml, content_type: 'text/yaml', status: 200 }
      format.xml  { render xml: Voter.all.to_xml, status: 200 }
    end
  end

  def create
    token = "placeholder"
    voter = Voter.new(name: params[:name], party: params[:party], auth_token: token )
    if voter.save
      respond_to do |format|
        format.html
        format.json { render json: voter.to_json, status: 200 }
        format.yaml { render text: voter.to_yaml, content_type: 'text/yaml', status: 200 }
        format.xml  { render xml: voter.to_xml, status: 200 }
      end
    else
      render json: voter.errors
    end
  end

  def update
    id = params[:id]
    n = params[:name]
    p = params[:party]

    voter = Voter.find(id)
    voter.update(name: n) if n
    voter.update(party: p) if p

    respond_to do |format|
      format.html
      format.json { render json: voter.to_json, status: 200 }
      format.yaml { render text: voter.to_yaml, content_type: 'text/yaml', status: 200 }
      format.xml  { render xml: voter.to_xml, status: 200 }
    end
  end

end
