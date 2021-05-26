class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @arts = Art.all
  end

  def show
    @disable_header = true
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.user_id = current_user.id
    if @art.save
      redirect_to art_path(@art)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @art.update(art_params)
      redirect_to art_path(@art)
    else
      render :edit
    end
  end

  def destroy
    @art.destroy
    redirect_to arts_path
  end

  private

  def set_art
    @art = Art.find(params[:id])
  end

  def art_params
    params.require(:art).permit(:artist, :title, :description, :price, :picture)
  end
end
