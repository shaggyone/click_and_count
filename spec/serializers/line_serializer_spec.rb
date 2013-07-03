require 'spec_helper'

describe LineSerializer do
  let!(:dummy_line_1) { Line.create data: Faker::Lorem.sentence }
  let!(:dummy_line_2) { Line.create data: Faker::Lorem.sentence }
  let!(:line)         { Line.create(data: "Some data") { |l| l.created_at = DateTime.parse('1961-04-12 10:35:21') } }

  subject { LineSerializer.new(line) }

  its(:data)           { should be == "Some data" }
  its(:timestamp)      { should be == '12.04.1961 10:35:21' }
  its(:queries_number) { should be == 3 }
end
