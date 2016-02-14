require 'spec_helper'

RSpec.describe 'CalculatorController' do
  it 'renders page' do
    get '/calculator'
    expect(last_response.status).to eq(200)
  end
end
