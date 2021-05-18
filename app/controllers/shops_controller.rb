class ShopsController < ApplicationController
  before_action :set_shop_and_schedules, only: %i[ show edit update destroy ]

  # GET /shops or /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1 or /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops or /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: "Shop was successfully created." }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1 or /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to edit_shop_path(@shop), notice: "Shop was successfully updated." }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1 or /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: "Shop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_and_schedules
      @shop = Shop.find(params[:id])
      @today_to_integer = ( Date.current.wday - 1 )
      @schedules = @shop.schedules
      @schedules_ordered_by_current_day = @schedules.rotate(@today_to_integer)
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:name,
        schedules_attributes: [
                             :id,
                             :morning_opens_at,
                             :morning_closes_at,
                             :afternoon_opens_at,
                             :afternoon_closes_at,
                             :weekday,
                             :shop_status,
                             :_destroy,
                             ])
    end
end
