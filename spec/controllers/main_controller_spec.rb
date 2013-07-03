require 'spec_helper'

describe MainController do
  before do
    15.times { Line.create data: Faker::Lorem.sentence }
  end

  context "#show action" do
    it "assigns lines count to @lines_count" do
      get "show"

      assigns(:lines_count).should be == 15
    end
  end
end
