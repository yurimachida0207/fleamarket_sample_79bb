class ToppagesController < ApplicationController
  def index
    @items = Item.includes(:images).order('updated_at DESC').first(4)
    
    # トップページのヘッダーに"こんにちは◯◯さん"と表示させるためにUserテーブルから情報を取得
    if user_signed_in?
      @hello_user = User.find(current_user.id)
    end

  end
end
