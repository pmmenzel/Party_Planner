require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe "index" do
  end

  describe "#show" do
    sign_in(user)
    get :show, id: user.id
    expect(status).to eq(200)
  end

end