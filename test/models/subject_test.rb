require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture subjects
  end

  test 'validate name presence' do
    subject = Subject.new name: ''
    subject.save
    assert subject.errors[:name].present?
  end
end
