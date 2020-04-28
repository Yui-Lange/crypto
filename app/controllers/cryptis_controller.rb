class CryptisController < ApplicationController
  before_action :set_crypti, only: [:show, :edit, :update, :destroy]

  # GET /cryptis
  # GET /cryptis.json
  def index
    @cryptis = Crypti.all
  end

  # GET /cryptis/1
  # GET /cryptis/1.json
  def show
  end

  # GET /cryptis/new
  def new
    @crypti = Crypti.new
  end

  # GET /cryptis/1/edit
  def edit
  end

  # POST /cryptis
  # POST /cryptis.json
  def create
    @crypti = Crypti.new(crypti_params)

    respond_to do |format|
      if @crypti.save
        format.html { redirect_to @crypti, notice: 'Crypti was successfully created.' }
        format.json { render :show, status: :created, location: @crypti }
      else
        format.html { render :new }
        format.json { render json: @crypti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cryptis/1
  # PATCH/PUT /cryptis/1.json
  def update
    respond_to do |format|
      if @crypti.update(crypti_params)
        format.html { redirect_to @crypti, notice: 'Crypti was successfully updated.' }
        format.json { render :show, status: :ok, location: @crypti }
      else
        format.html { render :edit }
        format.json { render json: @crypti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryptis/1
  # DELETE /cryptis/1.json
  def destroy
    @crypti.destroy
    respond_to do |format|
      format.html { redirect_to cryptis_url, notice: 'Crypti was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypti
      @crypti = Crypti.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crypti_params
      params.require(:crypti).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end
end
