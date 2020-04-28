class CryptaController < ApplicationController
  before_action :set_cryptum, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy, :show]


  # GET /crypta
  # GET /crypta.json
  def index
    @crypta = Cryptum.all

    require 'net/http'
    require 'json'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=4b9a7fa0-917a-425d-b627-b292dc733d46&start=1&limit=100&convert=USD'
    @url = URI(@url)
    @response = Net::HTTP.get(@url)
    @lookup_crypto = JSON.parse(@response)


  end

  # GET /crypta/1
  # GET /crypta/1.json
  def show
  end

  # GET /crypta/new
  def new
    @cryptum = Cryptum.new
  end

  # GET /crypta/1/edit
  def edit
  end

  # POST /crypta
  # POST /crypta.json
  def create
    @cryptum = Cryptum.new(cryptum_params)

    respond_to do |format|
      if @cryptum.save
        format.html { redirect_to @cryptum, notice: 'Cryptum was successfully created.' }
        format.json { render :show, status: :created, location: @cryptum }
      else
        format.html { render :new }
        format.json { render json: @cryptum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crypta/1
  # PATCH/PUT /crypta/1.json
  def update
    respond_to do |format|
      if @cryptum.update(cryptum_params)
        format.html { redirect_to @cryptum, notice: 'Cryptum was successfully updated.' }
        format.json { render :show, status: :ok, location: @cryptum }
      else
        format.html { render :edit }
        format.json { render json: @cryptum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypta/1
  # DELETE /crypta/1.json
  def destroy
    @cryptum.destroy
    respond_to do |format|
      format.html { redirect_to crypta_url, notice: 'Cryptum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cryptum
      @cryptum = Cryptum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cryptum_params
      params.require(:cryptum).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end

    def correct_user
      @correct = current_user.cryptums.find_by(id: params[:id])
      redirect_to crypta_path, notice: "Not Authorized to edit this entry" if @correct.nil?
    end
end
