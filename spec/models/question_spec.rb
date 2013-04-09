# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  prompt     :string(255)
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Question do
  describe '.create' do
    it 'creates an instance of a Question' do
      q = Question.create(prompt: 'test')
      expect(q.id).to_not be nil
    end
  end

  describe '#answers' do
    it 'is a list of the questions choices' do
      q = FactoryGirl.create(:question)
      correct = FactoryGirl.create(:answer_is_correct)
      incorrect = FactoryGirl.create(:answer_is_not_correct)
      q.answers = [correct, incorrect]
      expect(q.answers.count).to eq 2
    end
  end

  describe '#quiz' do
    it 'is the quiz that the question is a part of' do
      quiz = FactoryGirl.create(:quiz)
      q = FactoryGirl.create(:question)
      quiz.questions << q
      expect(q.quiz).to eq quiz
    end
  end

  describe '#correct_answers' do
    it 'is a list of the correct answers of the question' do
      q = FactoryGirl.create(:question)
      correct = FactoryGirl.create(:answer_is_correct)
      incorrect = FactoryGirl.create(:answer_is_not_correct)
      q.answers = [correct, incorrect]
      expect(q.correct_answers.first.to_i).to be 1
    end
  end

end
