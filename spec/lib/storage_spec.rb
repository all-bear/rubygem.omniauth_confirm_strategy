RSpec.describe OmniAuth::Confirm::Storage do
  it "must success check saved values" do
    auth_subject = 'abracadabra'
    code         = 'code'

    OmniAuth::Confirm::Storage.save(auth_subject, code)

    expect(OmniAuth::Confirm::Storage.check?(auth_subject, code)).to be true
  end

  it "must unsuccess check not saved values" do
    auth_subject = 'not_saved_abracadabra'
    code         = 'code'

    expect(OmniAuth::Confirm::Storage.check?(auth_subject, code)).to be false
  end
end