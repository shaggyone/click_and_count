# encoding: UTF-8
require 'spec_helper'

feature "Add line", js: true do
  background do
    visit '/'
  end

  scenario "Starting state 0 requests and no log data" do
    find('#CounterDiv').should have_content '0 запросов'
    find('#LogDiv').all('*').should be_empty
  end

  scenario "User added one line" do
    it "works! (now write some real specs)" do
      fill_in 'data_line', with: 'Some text'
      click 'Отправить строку'

      find('#data_line').should be_empty
      find('#CounterDiv').should have_content '1 запрос'
      find('#LogDiv').all('*').should have(1).item
      find('#LogDiv').all('*').first.text should =~ /\A\d{2}\.\d{2}\.\d{2} \d{2}:\d{2}:\d{2}\Z/
    end
  end
end
