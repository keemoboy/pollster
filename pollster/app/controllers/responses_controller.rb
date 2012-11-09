class ResponsesController < ApplicationController
 before_filter :load_poll, :load_question
  def index
    @responses = Response.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: poll_question_response_path(@poll, @question) }
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: poll_question_response_path(@poll, @question) }
    end
  end

  # GET /responses/new
  # GET /responses/new.json
  def new
    @response = Response.new
    @question_id = params[:question_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: poll_question_response_path(@poll, @question) }
    end
  end

  # GET /responses/1/edit
  def edit
    @response = Response.find(params[:id])
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(params[:response])
    @response.question = @question

    respond_to do |format|
      if @response.save
        format.html { redirect_to poll_question_response_path(@poll, @question, @response), notice: 'Response was successfully created.' }
        format.json { render json: poll_question_response_path(@poll, @question, @response), status: :created, location: @response }
      else
        format.html { render action: "new" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /responses/1
  # PUT /responses/1.json
  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to poll_question_response_path(@poll, @question), notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to poll_question_responses_path(@poll, @question) }
      format.json { head :no_content }
    end
  end

  private

  def load_poll
    @poll = Poll.find params[:poll_id]
  end

  def load_question
    @question = Question.find params[:question_id]
  end

end
