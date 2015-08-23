RSpec.describe OmniAuth::Confirm::Transport do
  it "must not throw errors" do
    auth_subject = 'abracadabra'
    code         = 'code'

    expect { OmniAuth::Confirm::Transport.deliver(auth_subject, code) }.to_not raise_error
  end
end