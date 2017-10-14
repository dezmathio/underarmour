require "spec_helper"
require './spec/stubs/stub_api.rb'

RSpec.describe Underarmour do
  it "has a version number" do
    expect(Underarmour::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(1.equal?(1)).to eq(true)
  end

  describe 'Using an ApiClient allows us to fetch a User' do
    let(:access_token) { 'access_token_returned_from_ua' }
    let(:api_key) {'client_id_provided_by_ua'}

    context '#user' do
      it 'returns a user' do
        StubApi::User.find_self
        user = Underarmour::ApiClient.scoped_api_client(Underarmour::User, 'user/', access_token: access_token, api_key: api_key).find_self
        expect(user.first_name).to eq 'Oswald'
      end
    end
    context '#privacy_option' do
      
      xit 'returns a privacy option description' do

      end

      xit 'returns the privacy options total_count' do

      end
    end
  end
end
