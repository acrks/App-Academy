require 'rails_helper'

RSpec.describe PoemsController, type: :controller do
  let(:jack) { User.create!(username: 'jack_bruce', password: 'abcdef') }
  let(:jasmine) { User.create!(username: 'jasmine', password: 'abcdef') }
  let(:jasmine_poem) { Poem.create!(title: 'New Haiku', stanzas: 'i need to be good, at haikus in general, need to get better', complete: 'false', author: jasmine) }

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "GET #index" do

    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "renders the poem index page" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "GET #new" do
    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "renders the page to create a new poem" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :new
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe 'POST #create' do

    before do
      allow(controller).to receive(:current_user) { jack }
    end

    context 'when logged in' do
      context 'with invalid params' do
        it 'validates the presence of all columns and renders the new template' do
          post :create, params: { poem: { title: 'Poem For My Own World', stanzas: "", complete: 'false' } }
          expect(response).to render_template(:new)
          expect(flash[:errors]).to eq(["Stanzas can't be blank"])
        end
      end

      context 'with valid params' do
        it 'creates the poem and redirects to the poem\'s index page' do
          post :create, params: { poem: 
                                  { title: 'The Garden',
                                    stanzas: 'walking daintily I will say, I\'ll walk in the Garden on this day',
                                    complete: 'true' 
                                  } 
                                }
          expect(response).to redirect_to(poems_url)
          expect(Poem.exists?(title: 'The Garden')).to be true
        end
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
          post :create, params: { poem: 
                                  { title: 'The Garden',
                                    stanzas: 'walking daintily I will say, I\'ll walk in the Garden on this day',
                                    complete: 'true' 
                                  } 
                                }
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "GET #edit" do
    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { jasmine }
      end

      it "renders the poem edit page" do
        get :edit, params: {id: jasmine_poem.id}
        expect(response).to render_template(:edit)
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :edit, params: {id: jasmine_poem.id}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when logged in as a different user' do
      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it 'should not allow users to update another user\'s poems' do
        begin
          patch :update, params: { id: jasmine_poem.id, poem: { title: 'Jack Poem now!' }}
        rescue ActiveRecord::RecordNotFound
        end
        edited_poem = Poem.find(jasmine_poem.id)
        expect(edited_poem.title).not_to eq('Jack Poem now!')
      end

      it 'should store an error to display to the user later' do
        begin
          patch :update, params: { id: jasmine_poem.id, poem: { title: 'Jack Poem now!' }}
        rescue ActiveRecord::RecordNotFound
        end
        expect(flash[:errors]).to eq(['Something went wrong!'])
      end
    end

    context 'when logged in as the poem\'s owner' do
      before do
        allow(controller).to receive(:current_user) { jasmine }
      end

      it 'updates the poem and redirects to the poem index page' do
        patch :update, params: { id: jasmine_poem.id, poem: { title: 'New Haiku Plus!' }}
        expect(Poem.exists?(title: 'New Haiku Plus!')).to be true
        expect(response).to redirect_to(poems_url)
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
          patch :update, params: { id: jasmine_poem.id, poem: { title: 'New Haiku Plus!' }}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end
end
