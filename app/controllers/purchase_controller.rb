class PurchaseController < ApplicationController

  require 'payjp'

  def index

    # 商品のデータベース情報をparamsで引っ張る
    @item = Item.find(params[:id])
    # ユーザーの住所などの情報
    @destination = Destination.where(user_id: current_user.id).first

    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    # 商品のデータベース情報をparamsで引っ張る
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    Payjp::Charge.create(
    :amount => @item.price,# 商品の売価
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end

  def done
    @item = Item.find(params[:id])
    @item.update( buyer_id: current_user.id)
  end

end