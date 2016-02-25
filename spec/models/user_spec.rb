require 'rails_helper'

describe User do


  let(:create_user) { create( :user ) }
  let(:build_user) { build( :user ) }


  it "regular parameters work" do
    expect( create_user ).to be_valid
  end
  
  it "does not save without password" do 
    expect{ create( :user, password: "") }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it "does not save with password mismatch" do 
    expect{ create( :user, password: "football", password_confirmation: "fotoball") }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it "does not save with short password" do 
    expect{ create( :user, password: "mp3", password_confirmation: "mp3") }.to raise_error( ActiveRecord::RecordInvalid )
  end


  context 'Searchable' do

    it "returns result when search is successful" do
      create_user
      expect(User.search("Foo").length).to eq(1)
    end

    it "returns empty result when search is unsuccessful" do
      create_user
      expect(User.search("z").length).to eq(0)
    end

    it "returns all users when search is empty" do
      3.times { create(:user) }
      expect(User.search("").length).to eq(3)
    end

  end


end


