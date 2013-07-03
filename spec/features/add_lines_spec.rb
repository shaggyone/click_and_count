# encoding: UTF-8
require 'spec_helper'

feature "Add line", js: true do

  context "zero items at start" do
    background do
      visit '/'
    end

    scenario "Starting state 0 requests and no log data" do
      find('#Counter').should have_content '0 запросов'
      find('#Log').all('*').should be_empty
    end

    scenario "User added one line" do
      Timecop.travel DateTime.parse "2013-07-03 13:25:00" do
        fill_in 'LineData', with: 'Some text'
        click_button 'Отправить строку'
        sleep 1

        find('#LineData').value.should be_blank
        find('#Counter').should have_content '1 запрос'
        find('#Log').all('p').should have(1).item
        find('#Log').all('p').first.text.should be == '03.07.2013 13:25:00'
      end
    end
  end
end
