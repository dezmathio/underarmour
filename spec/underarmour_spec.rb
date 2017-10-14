require "spec_helper"

RSpec.describe Underarmour do
  it "has a version number" do
    expect(Underarmour::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(1.equal?(1)).to eq(true)
  end

  describe 'Using an ApiClient allows us to fetch a User' do
    let(:access_token) { 'blabla' }

    it 'returns a user' do
      StubApi::User.find
      user = Underarmour::ApiClient.new(access_token: access_token).find(1)
      expect(user).to eq 'blabla'
    end
end
