RSpec.describe OmniAuth::Confirm::Validator do
  it "must success validate any string" do
    auth_subject = 'abracadabra'
    expect(OmniAuth::Confirm::Validator.validate(auth_subject)).to be true
  end

  it "must unsuccess validate empty string" do
    auth_subject = ''
    expect(OmniAuth::Confirm::Validator.validate(auth_subject)).to be false
  end
end