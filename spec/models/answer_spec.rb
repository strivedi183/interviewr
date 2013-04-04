# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  is_correct  :boolean
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Answer do
  let(:answer) {Answer.create(name:'Ruby on Rails')}

  describe '.new' do
    it 'creates an instance of an answer' do
      a = Answer.new
      expect(a).to be_an_instance_of(Answer)
    end
  end

  describe '.create' do
    it 'creates an answer' do
      expect(answer.id).to_not be nil
      expect(answer.name).to eq 'Ruby on Rails'
    end
  end

  describe '#answers' do
    it 'belongs to a question' do
      question = FactoryGirl.create(:question)
      question.answers << answer
      expect(question.answers.count).to eq 1
    end
  end
end