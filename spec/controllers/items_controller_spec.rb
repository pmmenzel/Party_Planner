require 'spec_helper'

describe ItemsController do
  let(:user) { create(:user) }
  let(:event) { create(:event)  }
  let(:event2) { create(:event) }
  let(:item_params1) { {name: 'jelly beans', quantity: 2, description: 'candy', event_id: event.id} }
  let(:item_params2) { {name: 'fruit snacks', quantity: 5, description: 'treat', event_id: event2.id} }
  let(:item) {create(:item, item_params1) }
  let(:item1) {create(:item, item_params2) }
  let(:objects) { [user, event, event2, item, item1] }


  describe "GET #index" do
    before(:each) do
      objects
    end

    it 'will not allow unauthenticated users to item index page' do
      get :index, event_id: event.id
      expect_redirect_to(new_user_session_path)
    end

    it 'will allow authenticated users to item index page' do
      sign_in(user)
      get :index, event_id: event.id
      expect_success
      expect(assigns(:items).to_a).to eq([item])
    end

  end

  describe "GET #new" do
    before(:each) do
      objects
    end

    it '' do
      get :new, event_id: event.id
      expect_redirect_to(new_user_session_path)
    end

    it '' do
      sign_in(user)
      get :new, event_id: event.id
      expect_success
      expect(assigns(:item)).to be_an_instance_of(Item)
    end
  end

  describe "POST #create" do
    before(:each) do
      objects
    end

    it "" do
      post :create, event_id: event.id, item: item_params1
      expect_redirect_to(new_user_session_path)
    end

    it "" do
      sign_in(user)
      expect { post :create, event_id: event.id, item:  item_params1 }.to change(Item, :count).by(1)
      expect_redirect_to(event_path(Item.last.event))
    end

    it 'items belong to specific events' do
      sign_in(user)
      expect { post :create, event_id: event2.id,
                             item: item_params2
             }.to change(Item, :count).by(1)
      expect_redirect

      event2.reload
      item = Item.last
      expect(event.items.to_a).to_not include(item)
      expect(event2.items.to_a).to include(item)
    end
  end

  describe "GET #show" do
    before(:each) do
      objects
    end

    it 'should redirect' do
      get :show, id: item.id, event_id: event.id
      expect_redirect_to(new_user_session_path)
    end

    it 'should return ok' do
      sign_in(user)
      get :show, id: item.id, event_id: event.id
      expect_success
    end

    it '' do
      sign_in(user)
      get :show, id: item.id, event_id: event.id
      expect(assigns(:item)).to eq(item)
    end
  end

  # describe "GET #edit" do
  #   it '' do
  #     get :edit
  #     expect_redirect_to(new_user_session_path)
  #   end
  # end

  # describe "GET #update" do
  #   it '' do
  #     get :update
  #     expect_success
  #   end
  # end

  # describe "GET #destroy" do
  #   it '' do
  #     get :destroy, id: item.id
  #     expect_success
  #   end
  # end

end
