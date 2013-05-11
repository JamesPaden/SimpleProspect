class RecipientsController < ApplicationController
  before_filter :load_campaign
  # GET /recipients
  # GET /recipients.json
  def index
    @recipients = @campaign.recipients.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipients }
    end
  end

  # GET /recipients/1
  # GET /recipients/1.json
  def show
    @recipient = @campaign.recipients.find(params[:id])
    @emails = @recipient.emails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipient }
    end
  end

  # GET /recipients/new
  # GET /recipients/new.json
  def new
    @recipient = @campaign.recipients.new

    @template_fields = {}
    @campaign.templates.each do |template|
      (template.body + template.subject).scan(/{{.*?}}/).each do |field|
        @template_fields[field.gsub("{","").gsub("}","")] = true
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipient }
    end
  end

  # GET /recipients/1/edit
  def edit
    @recipient = @campaign.recipients.find(params[:id])
  end

  # POST /recipients
  # POST /recipients.json
  def create
    @recipient = @campaign.recipients.new(params[:recipient])

    respond_to do |format|
      if @recipient.save

        send_time = Time.zone.parse(params[:start_time][:year] + "-" + params[:start_time][:month] + "-" + params[:start_time][:day] + " " + params[:start_time][:hour] + ":" + params[:start_time][:minute])
        @campaign.templates.each_with_index do |template,i|
          body = template.body
          subject = template.subject
          body.scan(/{{.*?}}/).each do |substitute|
            body = body.gsub(substitute, params[substitute.gsub("{","").gsub("}","")])
          end
          subject.scan(/{{.*?}}/).each do |substitute|
            subject = subject.gsub(substitute, params[substitute.gsub("{","").gsub("}","")])
          end
          if i > 0 
            send_time += template.delay.minutes
          end
          @recipient.emails.create(:subject => subject, :body => body, :send_time => send_time)

        end



        format.html { redirect_to campaign_recipients_path, notice: 'Recipient was successfully created.' }
        format.json { render json: [@campaign, @recipient], status: :created, location: [@campaign, @recipient] }
      else
        format.html { render action: "new" }
        format.json { render json: [@campaign, @recipient].errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipients/1
  # PUT /recipients/1.json
  def update
    @recipient = @campaign.recipients.find(params[:id])

    respond_to do |format|
      if @recipient.update_attributes(params[:recipient])
        format.html { redirect_to campaign_recipients_path, notice: 'Recipient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: [@campaign, @recipient].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipients/1
  # DELETE /recipients/1.json
  def destroy
    @recipient = @campaign.recipients.find(params[:id])
    @recipient.destroy

    respond_to do |format|
      format.html { redirect_to campaign_recipients_path }
      format.json { head :no_content }
    end
  end

  private
  def load_campaign
    @campaign = current_user.campaigns.find(params[:campaign_id])
  end
end
