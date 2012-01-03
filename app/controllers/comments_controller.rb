class CommentsController < ApplicationController
  before_filter :company, :only => ['new','index']
  before_filter :cookie_confirm, :only => ['index']

  def index
    @comments = @company.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :action => "index",:controller => "comments" }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        company
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
  
def company
    unless params[:company_id].blank?
      @company = Company.find(params[:company_id])
      @company_id = params[:company_id]
      session[:company_id] = params[:company_id]
    else
      @company = Company.find(session[:company_id])
      @company_id = session[:company_id]
    end
  end
  
  def cookie_confirm
    unless cookies[:society_evaluation].blank?
      @society_evaluation_cookie = cookies[:society_evaluation].to_s.split(":")
    end
    
    unless cookies[:student_evaluation].blank?
      @student_evaluation_cookie = cookies[:student_evaluation].to_s.split(":")
    end
  end

end
