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
      it 'returns user/self' do
        Underarmour::StubApi.scoped_api_client(Underarmour::User, 'user/').find_self
        user = Underarmour::ApiClient.scoped_api_client(Underarmour::User, 'user/', access_token: access_token, api_key: api_key).find_self
        expect(user.first_name).to eq 'Oswald'
      end
    end

  end
    
  describe 'Using my real credentials' do
    let(:access_token) { 'access_token_returned_from_ua' }
    let(:api_key) {'client_id_provided_by_ua'}

    context '#privacy_option' do
      it 'returns a privacy option api response' do
        Underarmour::StubApi.scoped_api_client(Underarmour::PrivacyOption, 'privacy_option/').find(1)
        privacy_option = Underarmour::ApiClient.scoped_api_client(Underarmour::PrivacyOption, 'privacy_option/', access_token: access_token, api_key: api_key).find

        aggregate_failures do
          expect(privacy_option.links).to eq({"self"=>[{"href"=>"/v7.1/privacy_option/?limit=20&offset=0"}], "documentation"=>[{"href"=>"https://developer.underarmour.com/docs/v71_Privacy_Option"}]})
          expect(privacy_option.embedded).to eq({ "privacy_options"=> [{"_links"=>{"self"=>[{"href"=>"/v7.1/privacy_option/0/", "id"=>"0"}]}, "description"=>"Private. Do Not Share"},
                {"_links"=>{"self"=>[{"href"=>"/v7.1/privacy_option/3/", "id"=>"3"}]}, "description"=>"Public. Share With Everyone"},
                {"_links"=>{"self"=>[{"href"=>"/v7.1/privacy_option/1/", "id"=>"1"}]}, "description"=>"Friends. Share With All My Friends"}]})
          expect(privacy_option.total_count).to eq 3
        end
      end
    end
    
    context '#user_profile_photo' do
      it 'returns a user_profile_photo as nil' do
        # @TODO: upload pic and then get a real response for this
        Underarmour::StubApi.scoped_api_client(Underarmour::UserProfilePhoto, 'user_profile_photo/').find
        user_profile_photo = Underarmour::ApiClient.scoped_api_client(Underarmour::UserProfilePhoto, 'user_profile_photo/', access_token: access_token, api_key: api_key).find
        expect(user_profile_photo.small).to be_nil
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
    context '#sleep' do
      xit 'returns a sleep' do

      end
    end
  end
end
