class VotersController < ApplicationController

  def show
    voter = Voter.find(params[:id])
    authenticate(voter.token)

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
    authenticate(voter.token)

    n = params[:name]
    p = params[:party]

    voter.name = params[:name] if params[:name]
    voter.party = params[:party] if params[:party]
    if voter.save
      respond_to do |format|
        format.html
        format.json { render json: voter.to_json, status: 200 }
        format.yaml { render text: voter.to_yaml, content_type: 'text/yaml', status: 200 }
        format.xml  { render xml: voter.to_xml, status: 200 }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: voter.errors.to_json, status: 400 }
        format.yaml { render text: voter.errors.to_yaml, content_type: 'text/yaml', status: 400 }
        format.xml  { render xml: voter.errors.to_xml, status: 400 }
      end
    end
  end

end
