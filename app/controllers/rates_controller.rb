class RatesController < ApplicationController
  before_action :set_rate, only: [:update]

  
  # POST /rates
  # POST /rates.json
  def create
    @rate = Rate.new(rate_params)
    @rate.user_id = current_user.id
    @rate.book_id = params[:book_id]
    respond_to do |format|
      if @rate.save
        format.html { redirect_to Book.find(params[:book_id]), notice: 'Rate was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @rate.update(rate_params)
        format.html { redirect_to Book.find(params[:book_id]), notice: 'Rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @rate }
      else
        format.html { render :edit }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:val, :book_id, :user_id)
    end
end
