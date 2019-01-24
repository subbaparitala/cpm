require 'rails_helper'

RSpec.describe PlacementsController, :type => :controller do

  describe "GET #index" do
    it "reads like a sentence (almost)" do
      get :index 
      expect(response).to render_template("index")
    end
  end

  describe "GET #search" do
    it "reads like a sentence (almost)" do
      get :search
      expect(response).to render_template("search")
    end
  end

end
