require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe "index" do
  end

  describe "#show" do
    it 'will not allow you to view show page if not an authenticated user' do
      get :show
      expect_redirect_to(new_user_session_path)
    end

    it "will allow user to view the user show page" do
      sign_in(user)
      get :show, id: user.id
      expect_success
    end
  end

  describe "#edit" do
    it 'will not allow you to view the user edit page if not an authenticated user' do
      get :edit, id: user.id
      expect_redirect_to(new_user_session_path)
    end

    it "will allow user to view the user show page" do
      sign_in(user)
      get :edit, id: user.id
      expect_success
    end
  end

end