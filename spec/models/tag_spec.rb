# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Tag do

  describe '.create' do
    it 'should create an instance of a Tag' do
      tag = Tag.create(name: 'test')
      expect(tag.id).to_not be nil
    end
  end

  describe '#quizzes' do
    it 'should be a list quizzes that have a specific tag' do
      quiz = FactoryGirl.create(:quiz)
      tag = FactoryGirl.create(:tag)
      tag.quizzes << quiz
      expect(tag.quizzes.first).to eq quiz
    end
  end
end
