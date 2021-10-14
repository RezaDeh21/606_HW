require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    before (:each) do
        @movie_prams = {:title => '007 - 2021', :rating => 'R', :release_date => '14-Oct-2021', :director => 'Me2'}
        @movie = FactoryGirl.create(:movie)
    end
    
    describe 'index' do
      it 'should display the index template' do
          get :index
          expect(response).to render_template(:index)
      end
  end
  describe "new" do
      it "should display the new template" do
          get :new
          expect(response).to render_template(:new)
      end
  end
    
    describe "create" do
        it "should create movie with give prams" do
            expect {post :create, movie: @movie_prams}.to change(Movie,:count).by(1)
        end
        it "should set the saved movie" do
            post :create, movie: @movie_prams
            expect(assigns(:movie).title).to eq("007 - 2021")
            expect(assigns(:movie).rating).to eq("R")
            expect(assigns(:movie).release_date).to eq("14-Oct-2021")
            expect(assigns(:movie).director).to eq("Me2")
        end
        it "should redirect user to home page" do
            post :create, movie: @movie_prams
            expect(response).to redirect_to(:action => 'index')
        end
    end
  
    describe "show" do
      it "should set the requested movie" do
        get :show, id: @movie
        expect(assigns(:movie).title).to include("Movie1")
      end
      it "should provide the show template" do
        get :show, id: @movie
        expect(response).to render_template(:show)
      end
    end
    
    
    describe "edit" do
      it "should edit a movie by id" do
          expect(Movie).to receive(:find).and_return(@movie)
          get :edit, :id => @movie.id
          expect(response).to render_template(:edit)
      end
    end
  
    describe "update" do
      it "should find the requested movie" do
        put :update, id: @movie, movie: @movie_prams
        expect(assigns(:movie)).to eq(@movie)
      end
      it "should edit the requested movies fields" do
        put :update, id: @movie, movie: @movie_prams
        @movie.reload
        expect(@movie.title).to eq("007 - 2021")
        expect(@movie.rating).to eq("R")
        expect(@movie.release_date).to eq("14-Oct-2021")
        expect(@movie.director).to eq("Me2")
      end
      it "should redirect to the updated movie" do
        put :update, id: @movie, movie: @movie_prams
        expect(response).to redirect_to @contact
      end
    end
  
    describe "delete" do
      it "should delete the existing movie" do
        expect{
          delete :destroy, id: @movie
        }.to change(Movie,:count).by(-1)
      end
      it "should redirect user to home page " do
        delete :destroy, id: @movie
        expect(response).to redirect_to(:action => 'index') 
      end
    end
    
end