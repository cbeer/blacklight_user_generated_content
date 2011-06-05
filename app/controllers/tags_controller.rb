class TagsController < ApplicationController
  include Blacklight::SolrHelper

  def index
    @response, @documents = get_solr_response_for_field_values("id",params[:catalog_id])
    @document = @documents.first

    @tags = @document.owner_tag_list_on(nil, :tags)

    respond_to do |format|
      format.html
    end
  end

  def show
    @response, @documents = get_solr_response_for_field_values("id",params[:catalog_id])
    @document = @documents.first

    @tags = @document.owner_tag_list_on(nil, :tags)

    respond_to do |format|
      format.html
    end
  end

  def new
    @response, @documents = get_solr_response_for_field_values("id",params[:catalog_id])
    @document = @documents.first

    @tags = @document.owner_tag_list_on(nil, :tags)

    respond_to do |format|
      format.html
    end
  end

  def edit
    @tag = ActsAsTaggableOn::Tag.find_by_name(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def create
    @response, @documents = get_solr_response_for_field_values("id",params[:catalog_id])
    @document = @documents.first

    #@document.tag_list << params[:tags].split(",").map(&:strip)
    if current_user
      current_user.tag(@document, :with => params[:tags], :on => 'tags') 
    else
      User.new.tag(@document, :with => params[:tags], :on => 'tags')
    end
    @document.save rescue nil

    respond_to do |format|
      format.html { redirect_to new_catalog_tags_path(:catalog_id => @document.id) }
      format.json { render :json => @document.tag_list }
    end
  end

  def update
    @response, @documents = get_solr_response_for_field_values("id",params[:catalog_id])
    @document = @documents.first

  end

  def destroy
    @tag = ActsAsTaggableOn::Tag.find_by_name(params[:id])
    @tag.destroy
  end
end
