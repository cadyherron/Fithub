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


end
