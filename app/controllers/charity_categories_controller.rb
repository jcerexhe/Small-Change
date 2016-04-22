class CharityCategoriesController < ApplicationController
  before_action :set_charity_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  # GET /charity_categories
  # GET /charity_categories.json
  def index
    if current_user.charity_id.present?
      @charity = Charity.find(current_user.charity_id)
      @index_title = (@charity.name.last == "s" ? @charity.name + "'" : @charity.name + "'s") + " Categories"
      @charity_categories = CharityCategory.where(charity_id: @charity.id)
    else
      @charity_categories = CharityCategory.all
      @index_title = "Charity Categories"
    end
  end

  # GET /charity_categories/1
  # GET /charity_categories/1.json
  def show
  end

  # GET /charity_categories/new
  def new
    @charity = Charity.find(current_user.charity_id)
    @charity_category = CharityCategory.new
  end

  # GET /charity_categories/1/edit
  def edit
  end

  # POST /charity_categories
  # POST /charity_categories.json
  def create
    @charity_category = CharityCategory.new(charity_category_params)

    respond_to do |format|
      if @charity_category.save
        format.html { redirect_to @charity_category, notice: 'Charity category was successfully created.' }
        format.json { render :show, status: :created, location: @charity_category }
      else
        format.html { render :new }
        format.json { render json: @charity_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charity_categories/1
  # PATCH/PUT /charity_categories/1.json
  def update
    respond_to do |format|
      if @charity_category.update(charity_category_params)
        format.html { redirect_to @charity_category, notice: 'Charity category was successfully updated.' }
        format.json { render :show, status: :ok, location: @charity_category }
      else
        format.html { render :edit }
        format.json { render json: @charity_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charity_categories/1
  # DELETE /charity_categories/1.json
  def destroy
    @charity_category.destroy
    respond_to do |format|
      format.html { redirect_to charity_categories_url, notice: 'Charity category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charity_category
      @charity_category = CharityCategory.find(params[:id])
    end

    def authenticate_admin
      unless current_user.admin || current_user.charity_id.present? == true
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charity_category_params
      params.require(:charity_category).permit(:charity_id, :category_name, :description)
    end
end
