class ShortenedsController < ApplicationController
  before_action :set_shortened, only: [ :edit, :update, :destroy]

  # GET /shorteneds
  # GET /shorteneds.json
  def index
    @shorteneds = Shortened.all
  end

  # GET /shorteneds/1
  # GET /shorteneds/1.json
  def show
    @shortened =Shortened.find_by(short_url:params[:short_url])
    redirect_to @shortened.in_url
  end

  # GET /shorteneds/new
  def new
    @shortened = Shortened.new
  end

  # GET /shorteneds/1/edit
  def edit
  end

  # POST /shorteneds
  # POST /shorteneds.json
  def create
    @shortened = Shortened.new(shortened_params)
    @shortened.short_url = "#{rand(36**5).to_s(36)}"

    @shortened.in_url = "https://#{@shortened.in_url}" unless
    @shortened.in_url.include?("https://") || @shortened.in_url.include?("http://")





    respond_to do |format|
      if @shortened.save
        format.html { redirect_to @shortened, notice: 'Shortened was successfully created.' }
        format.json { render :show, status: :created, location: @shortened }
      else
        format.html { render :new }
        format.json { render json: @shortened.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shorteneds/1
  # PATCH/PUT /shorteneds/1.json
  def update
    respond_to do |format|
      if @shortened.update(shortened_params)
        format.html { redirect_to @shortened, notice: 'Shortened was successfully updated.' }
        format.json { render :show, status: :ok, location: @shortened }
      else
        format.html { render :edit }
        format.json { render json: @shortened.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorteneds/1
  # DELETE /shorteneds/1.json
  def destroy
    @shortened.destroy
    respond_to do |format|
      format.html { redirect_to shorteneds_url, notice: 'Shortened was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_shortened
    @shortened = Shortened.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shortened_params
    params.require(:shortened).permit(:in_url, :http_status)
  end
end
