require 'rails_helper'

RSpec.describe GamesController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST create" do
    it "returns http success" do
      get :create, player1: "Player1", player2: "Player2"
      expect(response).to redirect_to edit_game_path(1)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to render_template :new
    end
  end
=begin
  describe "GET edit" do
    it "returns http success" do
      get :edit, id: 1
      expect(response).to render_template :edit
    end
  end

  describe "PATCH update" do
    it "returns http success" do
      get :update, id: 1
      expect(response).to redirect_to edit_game_path
    end
  end
=end
end
