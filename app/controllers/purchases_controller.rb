class PurchasesController < ApplicationController
  # POST /purchases
  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      render json: @purchase, status: :created
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private
  # Only allow a trusted parameter "white list" through.
  def purchase_params
    params.require(:purchase).permit(:user_id, :purchase_option_id)
  end
end
