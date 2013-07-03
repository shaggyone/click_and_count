# encoding: UTF-8
require 'spec_helper'

feature "Add line", js: true do
  context "#Counter" do
    context "zero items at start" do
      background do
        visit '/'
      end

      specify "Starting state 0 request" do
        find('#Counter').should have_content '0 запросов'
      end
    end

    context "one item at start" do
      background do
        Line.create data: 'Some data'
        visit '/'
      end

      specify "Starting state 1 request" do
        find('#Counter').should have_content '1 запрос'
      end
    end

    context "some items at start" do
      background do
        3.times { Line.create data: 'Some data' }
        visit '/'
      end

      specify "Starting state some requests" do
        find('#Counter').should have_content '3 запроса'
      end
    end

    context "many items at start" do
      background do
        11.times { Line.create data: 'Some data' }
        visit '/'
      end

      specify "Starting state many requests" do
        find('#Counter').should have_content '11 запросов'
      end
    end
  end

  context "zero items at start" do
    background do
      visit '/'
    end

    scenario "Starting state 0 requests and no log data" do
      find('#Counter').should have_content '0 запросов'
      find('#Log').all('p').should be_empty
    end

    scenario "User added one line" do
      Timecop.travel DateTime.parse "2013-07-03 13:25:00" do
        fill_in 'LineData', with: 'Some text'
        click_button 'Отправить строку'
        sleep 1

        find('#LineData').value.should be_blank
        find('#Counter').should have_content '1 запрос'
        find('#Log').all('p').should have(1).item
        find('#Log').all('p').last.text.should be == '03.07.2013 13:25:00'
      end
    end
  end

  context "context zero items" do
    background do
      22.times { Line.create data: 'Some data' }
      visit '/'
      2.times do
        fill_in 'LineData', with: 'Some text'
        click_button 'Отправить строку'
        sleep 0.2
      end
    end

    scenario "Starting state 0 requests and no log data" do
      find('#Counter').should have_content '24 запроса'
      find('#Log').all('p').should have(2).items
    end

    scenario "User added one line" do
      Timecop.travel DateTime.parse "2013-07-03 13:25:00" do
        fill_in 'LineData', with: 'Some text'
        click_button 'Отправить строку'
        sleep 1

        find('#LineData').value.should be_blank
        find('#Counter').should have_content '25 запросов'
        find('#Log').all('p').should have(3).item
        find('#Log').all('p').last.text.should be == '03.07.2013 13:25:00'
      end
    end

  end
end
