require "rails_helper"

RSpec.describe OmniAuth::Confirm::Generator do
  it "must generate number beetwen 1000 and 9999" do
    auth_subject = '' # doesn't take matter for this generator
    expect(OmniAuth::Confirm::Generator.generate(auth_subject)).to be_between(1000, 9999)
  end
end