require 'rails_helper'
require './spec/factories/doctors.rb'
require './spec/factories/users.rb'

RSpec.describe "Appointments", type: :request do
  context 'create action check' do
  before do
    @doctor = FactoryBot.create :doctor, name: "Иван Иванович", email: "featuredoctor@gmail.com", phone_number: "0668766723", password: "111111", password_confirmation: "111111", category: Category.new(name: "Хирург")
    @user = FactoryBot.create :user, name: "Василий Петрович", email: "featureuser@gmail.com", phone_number: "0668762723", password: "111111", password_confirmation: "111111"
    post "/appointments", params: {desired_time: Date.today, complaint: "Жалоба", user: @user, doctor: @doctor}
  end
  
  it 'returns a status code of 302' do
    expect(response).to have_http_status(302)
  end
  end
end
