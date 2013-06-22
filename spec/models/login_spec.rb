require 'spec_helper'

describe Login do

  describe 'authenticate' do
    before :each do
      Reader.create(id: 1, email: 'bob@email.com', password: 'pass',
                           password_confirmation: 'pass')
    end

    it 'returns reader id if credentials are valid' do
      login = Login.new(email: 'bob@email.com', password: 'pass')
      expect(login.authenticate).to eq(1)
    end

    it 'returns nil if email not valid' do
      login = Login.new(email: 'bob@hacker.com', password: 'pass')
      expect(login.authenticate).to be_nil
    end

    it 'returns nil if password not valid' do
      login = Login.new(email: 'bob@email.com', password: 'wrong')
      expect(login.authenticate).to be_nil
    end
  end

  context "attributes" do

    let(:login) { Login.new }

    it "has email" do
      login.email = "email@email.com"
      expect(login.email).to eq("email@email.com")
    end

    it "has password" do
      login.password = "password"
      expect(login.password).to eq("password")
    end

  end

end