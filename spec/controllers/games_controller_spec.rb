require 'rails_helper'

RSpec.describe GamesController, :type => :controller do

  describe "GET index" do
    it "renders index template" do
      get :index
      expect(response).to render_template :index
    end
    it "has a ranking table" do
      get :index
      expect(assigns(:ranking_table)).not_to eq(nil)
    end
  end

  describe "POST create" do
    before :each do
      post :create, player1: "Player1", player2: "Player2"
    end
    it "assigns the game variable" do
      game = Game.new("Player1", "Player2")
      expect(assigns(:game)).to eq(game)
    end
    it "redirects to edit the game" do
      expect(response).to redirect_to edit_game_path(0)
    end
  end

  describe "GET new" do
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET edit" do
    context "without a session variable for the game" do
      it "redirects to index" do
        get :edit, id: 0
        expect(response).to redirect_to games_path
      end
    end
    context "with session variable for the game" do
      it "fetchs the game satus from the session" do
        game = Game.new("Player1", "Player2")
        session[:game] = game.to_yaml
        get :edit, id: 0
        expect(assigns(:game)).to eq(game)
      end
    end
  end

  describe "PUT update" do
    context "without a session variable for the game" do
      it "redirects to index" do
        put :update, id: 0
        expect(response).to redirect_to games_path
      end
    end
    context "with session variable for the game" do
      it "fetchs the game satus from the session" do
        game = Game.new("Player1", "Player2")
        session[:game] = game.to_yaml
        put :update, id: 0
        expect(assigns(:game)).not_to eq(game)
      end
    end
  end
end
