require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Anthony', photo: 'https://un/photos/F_-0BxGuVvo', bio: 'Full-Stack web dev.') }
  before { subject.save }

  it 'name should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be an integer greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
