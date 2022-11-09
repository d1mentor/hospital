require 'rails_helper'

RSpec.describe Doctor, type: :model do
  context 'validations check' do
    it { should validate_presence_of :phone_number }
  end
end
