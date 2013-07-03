require 'spec_helper'

describe LinesController do
  context "#create" do
    it "creates a new Line" do
      expect { post :create, line: { data: "Some data" } }.to change{Line.count}.by(1)
    end

    it "responses with a created line serializer" do
      Timecop.freeze DateTime.parse '1961-04-12 10:35:21' do
        post :create, line: { data: "Some data" }, format: :json

        JSON.parse(response.body).should \
          be == {"data" => "Some data", "timestamp" => "12.04.1961 10:35:21","queries_number" =>  1, "errors" => {}}
      end
    end
  end
end
