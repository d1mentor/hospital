require 'rails_helper'
require './spec/factories/doctors.rb'
require './spec/factories/users.rb'
require './spec/factories/appointments.rb'

RSpec.feature 'DOCTOR creates a recomendation', type: :feature do
  before do
    @doctor = FactoryBot.create :doctor, name: "Иван Иванович", email: "featuredoctor@gmail.com", phone_number: "0668766723", password: "111111", password_confirmation: "111111", category: Category.new(name: "Хирург")
    login_as @doctor, scope: :doctor
    @user = FactoryBot.create :user, name: "Василий Петрович", email: "featureuser@gmail.com", phone_number: "0668762723", password: "111111", password_confirmation: "111111"
    @appointment = FactoryBot.create :appointment, desired_time: Date.today, complaint: "Тестовая жалоба", user: @user, doctor: @doctor
  end

  scenario 'successfully' do
    visit '/'
    #visit '/doctors/profile'

    click_link 'Личный кабинет'
    click_link 'Василий Петрович'
    fill_in('appointment_recomendation', :with => 'Тестовая рекомендация')
    click_on 'Отправить'
    expect(page).to have_current_path("/doctors/profile")

    save_and_open_page
  end
end