class EmailsController < ApplicationController
  before_filter :require_login, :except => [:open]
  before_filter :load_recipient, :except => [:open]
  # GET /emails  
  # GET /emails.json
  def index
    @emails = @recipient.emails.all

    respond_to do |format|  
      format.html # index.html.erb
      format.json { render json: @emails }
    end
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
    @email = @recipient.emails.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email }
    end
  end

  # GET /emails/new
  # GET /emails/new.json
  def new
    @email = @recipient.emails.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email }
    end
  end

  # GET /emails/1/edit
  def edit
    @email = @recipient.emails.find(params[:id])
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = @recipient.emails.new(params[:email])

    respond_to do |format|
      if @email.save
        format.html { redirect_to recipient_emails_path, notice: 'Email was successfully created.' }
        format.json { render json: @email, status: :created, location: @email }
      else
        format.html { render action: "new" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /emails/1
  # PUT /emails/1.json
  def update
    @email = @recipient.emails.find(params[:id])

    respond_to do |format|
      if @email.update_attributes(params[:email])
        format.html { redirect_to recipient_emails_path, notice: 'Email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email = @recipient.emails.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to recipient_emails_path }
      format.json { head :no_content }
    end
  end

  def open
    @email = Email.find(params[:id])
    @email.open_count = @email.open_count + 1
    @email.save
    send_file Rails.root.join('app','assets','images','spacer.png'), :type => 'image/png', :disposition => 'inline' 
  end

  private
  def load_recipient
    @campaign = Campaign.find(params[:campaign_id])
    @recipient = @campaign.recipients.find(params[:recipient_id])
  end
end
