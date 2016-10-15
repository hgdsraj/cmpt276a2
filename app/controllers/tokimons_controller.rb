class TokimonsController < ApplicationController
  before_action :set_tokimon, only: [:show, :edit, :update, :destroy]

  # GET /tokimons
  # GET /tokimons.json
  def index
    @tokimons = Tokimon.all
  end

  # GET /tokimons/battle
  # GET /tokimons.json
  def battle
    @tokimons = Tokimon.all
  end

  # GET /tokimons/battler
  # GET /tokimons.json
  def battler
    @tokimon_one = Tokimon.find(battle_params[:tokimon_one])
    @tokimon_two = Tokimon.find(battle_params[:tokimon_two])
    result = "The Winner is... "
    if Tokimon.getTotal(@tokimon_one) > Tokimon.getTotal(@tokimon_two)
      result += String(@tokimon_one.name)
    elsif Tokimon.getTotal(@tokimon_one) < Tokimon.getTotal(@tokimon_two)
      result += String(@tokimon_two.name)
    else
      result = "It was a tie! :("
    end

    respond_to do |format|
      format.html { redirect_to tokimons_url, notice: result}
      format.json { render :show, location: battle }
    end
  end

  # GET /tokimons/1
  # GET /tokimons/1.json
  def show
    @trainer = Trainer.find(@tokimon.trainer_id)
  end

  # GET /tokimons/new
  def new
    @tokimon = Tokimon.new
  end

  # GET /tokimons/1/edit
  def edit
  end

  # POST /tokimons
  # POST /tokimons.json
  def create
    trainer = Trainer.find(tokimon_params[:trainer_id])
    Trainer.SetLevel(trainer)
    @tokimon = Tokimon.new(tokimon_params)
    @tokimon.total = Tokimon.setTotal(@tokimon)
    respond_to do |format|
      if @tokimon.save
        format.html { redirect_to @tokimon, notice: 'Tokimon was successfully created.' }
        format.json { render :show, status: :created, location: @tokimon }
      else
        format.html { render :new }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tokimons/1
  # PATCH/PUT /tokimons/1.json
  def update
    respond_to do |format|

      if @tokimon.update(tokimon_params)
        @tokimon.total = Tokimon.setTotal(@tokimon)
        @tokimon.save

        trainer = Trainer.find(tokimon_params[:trainer_id])
        Trainer.SetLevel(trainer)

        format.html { redirect_to @tokimon, notice: 'Tokimon was successfully updated.' }
        format.json { render :show, status: :ok, location: @tokimon }
      else
        format.html { render :edit }
        format.json { render json: @tokimon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tokimons/1
  # DELETE /tokimons/1.json
  def destroy
    @tokimon.destroy
    respond_to do |format|
      format.html { redirect_to tokimons_url, notice: 'Tokimon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tokimon
      @tokimon = Tokimon.find(params[:id])
    end
    def battle_params
      params.require(:tokimon).permit(:tokimon_one, :tokimon_two)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tokimon_params
      params.require(:tokimon).permit(:name, :weight, :height, :defense, :health, :fly, :fight, :fire, :water, :electric, :ice, :psychic, :trainer_id)
    end
end
