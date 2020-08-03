require 'rails_helper'

describe Users::RegistrationsController do

  describe 'GET #new' do
    it 'assigns the requested user to @user' do
      user = create(:user)
      get :new, params: { id: user}
      expect(assigns(:user)).to eq user
    end

    it 'renders the :new template' do
      user = create(:user)
      get :new, params: { id: user}
      expect(response).to render_template :new
    end
    
  end
end