class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :homepage
  # load_and_authorize_resource :except => [:homepage]

  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.all
  end

  def homepage
    @announcements = Announcement.all.order("view DESC")

    @announcements = @announcements.where(category: params[:category_id]) unless params[:category_id].blank?
    @announcements = @announcements.where("UPPER(description) like ?", "%#{params[:search_term].to_s.upcase}%") unless params[:search_term].blank? end
  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @ads = Announcement.find(params[:id])
    if (@ads.view.nil?)
      @viewn = 1
    else
      @viewn = @ads.view + 1
    end
    Announcement.all.update(@ads.id, :view => @viewn)
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
    @categories = Category.all


  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.user_id = current_user.id
    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url, notice: 'Announcement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:title, :description, :price, :category_id, :user_id, {avatars: []})
    end
end
