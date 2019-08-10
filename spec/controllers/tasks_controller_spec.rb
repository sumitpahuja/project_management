require "rails_helper"
require 'spec_helper'

RSpec.describe TasksController, :type => :controller do
  describe "GET index" do
    it "requires login" do
      get :new
      expect(response).to redirect_to "/users/sign_in"
    end    
  end
end