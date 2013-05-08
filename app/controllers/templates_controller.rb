class TemplatesController < ApplicationController
  before_filter :require_login, :load_campaign
  # GET /templates
  # GET /templates.json
  def index
    @templates = @campaign.templates

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @templates }
    end
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
    @template = @campaign.templates.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @template }
    end
  end

  # GET /templates/new
  # GET /templates/new.json
  def new
    @template = @campaign.templates.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @template }
    end
  end

  # GET /templates/1/edit
  def edit
    @template = @campaign.templates.find(params[:id])
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = @campaign.templates.new(params[:template])

    respond_to do |format|
      if @template.save
        format.html { redirect_to campaign_templates_path, notice: 'Template was successfully created.' }
        format.json { render json: [@campaign, @template], status: :created, location: [@campaign, @template] }
      else
        format.html { render action: "new" }
        format.json { render json: [@campaign, @template].errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /templates/1
  # PUT /templates/1.json
  def update
    @template = @campaign.templates.find(params[:id])

    respond_to do |format|
      if @template.update_attributes(params[:template])
        format.html { redirect_to campaign_templates_path, notice: 'Template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: [@campaign, @template].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template = @campaign.templates.find(params[:id])
    @template.destroy

    respond_to do |format|
      format.html { redirect_to campaign_templates_path }
      format.json { head :no_content }
    end
  end

  private
  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
