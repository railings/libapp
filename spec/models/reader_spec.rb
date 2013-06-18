require 'spec_helper'

describe Reader do
  let(:reader) { Reader.new }

  it "is an ActiveRecord model" do
    expect(Reader.superclass).to eq(ActiveRecord::Base)
  end

  it "has email" do
    reader.email = "someemail@email.com"
    expect(reader.email).to eq("someemail@email.com")
  end

  it "responds to password" do
    reader.password = "password"
    expect(reader.password).to eq("password")
  end

  it "responds to password_confirmation" do
    reader.password_confirmation = "password"
    expect(reader.password_confirmation).to eq("password")
  end

  describe "validations" do
    before :each do
      @params = {
          email: 'email@email.com',
          password: 'pass',
          password_confirmation: 'pass',
      }
    end

    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }

    it "is invalid when email is invalid" do
      @params[:email] = 'reader'
      reader = Reader.new(@params)
      expect(reader.valid?).to be_false
    end

    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
  end
end
