class CommentsController < ApplicationController
  include Blacklight::SolrHelper

  # GET /comments
  # GET /comments.xml
  def index
    @response, @documents = get_solr_response_for_field_values("id",params[:catalog_id])
    @document = @documents.first
    @comments = @document.comments
    @comments ||= Comment.all

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
    @response, @documents = get_solr_response_for_field_values("id",params[:catalog_id])
    @document = @documents.first

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
    params[:comment][:commentable_type] = "Surrogate" if params[:comment][:commentable_type] == "SolrDocument"
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        redirect_to catalog_comments_url(:catalog_id => @comment.commentable_id) and return if @comment.commentable_type == "Surrogate" 
        format.html { redirect_to(@comment, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
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
        redirect_to catalog_comments_url(:catalog_id => @comment.commentable_id) and return if @comment.commentable_type == "Surrogate" 
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
    
    redirect_to catalog_comments_url(:catalog_id => @comment.commentable_id) and return if @comment.commentable_type == "Surrogate" 

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
