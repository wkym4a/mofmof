class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create

    @item = Item.new(item_params)

    ActiveRecord::Base.transaction do
    #@item.transaction do

      @item.save!

       2.times do |i|

         @station = Station.new(station_params(i+1))
         @station.item_id = @item.id

         @station.save!

       end
    end

    redirect_to @item, notice: '新しい物件情報を登録しました。'

    rescue => e

    render :new , notice: '新しい物件情報の登録に失敗しました。'

    #
    #   if @item.save
    #     format.html { redirect_to @item, notice: 'Item was successfully created.' }
    #     format.json { render :show, status: :created, location: @item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
  end

  def update

    ActiveRecord::Base.transaction do
    #@item.transaction do

    binding.pry
      @item.update(item_params)

      binding.pry
       2.times do |i|

         @station = @item.stations.find_by(item_sub_id: i+1)

         @station.update!(station_params(i+1))
       end
    end

    redirect_to @item, notice: '物件の更新に成功しました。'

  rescue => e
    render :new, notice: '物件の更新に失敗しました。'

  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :rent_price, :address, :age, :matter)
    end

    def station_params(i)
      params.require("station_" + i.to_s ).permit(:item_sub_id ,:route, :name, :walk_time)
    end
end
