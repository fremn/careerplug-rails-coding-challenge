require 'rails_helper'

describe User, type: :model do
  it { is_expected.to respond_to(:jobs) }

  it 'has first_name' do
    expect(subject).to have_attribute(:first_name)
  end
  it 'has last_name' do
    expect(subject).to have_attribute(:last_name)
  end
  it 'has email' do
    expect(subject).to have_attribute(:email)
  end
end
