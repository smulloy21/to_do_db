require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    fill_in('list', :with =>'Epicodus Work')
    click_button('Add list')
    expect(page).to have_content('Epicodus Work')
  end
end

describe('viewing a list', {:type => :feature }) do
  it('allows a user to see all of the tasks associated with that list') do
    visit('/')
    fill_in('list', :with =>'Epicodus Work')
    click_button('Add list')
    click_link('Epicodus Work')
    expect(page).to have_content('Tasks')
  end
end
