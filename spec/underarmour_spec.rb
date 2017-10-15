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
    
    context '#user_profile_photo' do
      
      xit 'returns a user_profile_photo with a small image reference' do

      end
    end

    context '#user_role' do
      
      xit 'returns a user_role with role & a user reference' do

      end
    end

    context '#user_stats' do
      
      xit 'returns an array of stats with aggregation data' do

      end
    end

    context '#activity_type' do
      xit 'returns an activity_type' do

      end
    end

    context '#actigraphy' do
      xit 'returns an actigraphy' do

      end
    end

    context '#aggregate' do
      xit 'returns an aggregate' do

      end
    end
    context '#allday_activity_timeseries' do
      xit 'returns an allday_activity_timeseries' do

      end
    end
    context '#allday_activity' do
      xit 'returns an allday_activity' do

      end
    end
    context '#bodymass' do
      xit 'returns a bodymass' do

      end
    end

  end
end
