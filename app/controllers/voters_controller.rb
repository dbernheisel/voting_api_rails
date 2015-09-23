class VotersController < ApplicationController

  def show
    voter = Voter.find(params[:id])
    token = params[:token]
    unless token == voter.token
      render json: {Error: "Bad Token"}.to_json
      return
    end

    begin
      respond_to do |format|
        format.html
        format.json { render json: voter.to_json, status: 200 }
        format.yaml { render text: voter.to_yaml, content_type: 'text/yaml', status: 200 }
        format.xml  { render xml: voter.to_xml, status: 200 }
      end
    rescue
      render json: voter.errors
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
    voter = Voter.new(name: params[:name], party: params[:party] )
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
    voter = Voter.find(params[:id])
    token = params[:token]
    unless token == voter.token
      render json: {Error: "Bad Token"}.to_json
      return
    end

    n = params[:name]
    p = params[:party]

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
