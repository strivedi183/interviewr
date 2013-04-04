# == Schema Information
#
# Table name: quizzes
#
#  id        :integer          not null, primary key
#  name      :string(255)
#  is_public :boolean
#  cost      :decimal(, )      default(0.0)
#  code      :string(255)
#  num_pass  :integer
#  user_id   :integer
#

require 'spec_helper'

describe Quiz do
  describe '.create' do
    it 'an instance of a Quiz' do
      expect(Quiz.new).to be_an_instance_of(Quiz)
    end
  end

  describe '#results' do
    it 'is a list of all of the results of the quiz' do
      user = FactoryGirl.create(:user)
      q1 = FactoryGirl.create(:quiz)
      r1 = FactoryGirl.create(:result)
      user.results << r1
      q1.results << r1
      expect(r1.quiz_id).to eq q1.id
      # expect user.results to equal results where user_id is equal to user's id
    end
  end

  describe '#user' do
    it 'is the user who created the quiz' do
      user = FactoryGirl.create(:user)
      quiz1 = FactoryGirl.create(:quiz)
      user.quizzes << quiz1
      expect(quiz1.user.id).to eq user.id
    end
  end

  describe '#tags' do
    it "is a list of the quiz's tags" do
      quiz = FactoryGirl.create(:quiz)
      tag = FactoryGirl.create(:tag)
      quiz.tags << tag
      expect(quiz.tags.first).to eq tag
    end
  end

  describe '#questions' do
    it 'is a list of the quizs questions' do
      quiz = FactoryGirl.create(:quiz)
      q1 = FactoryGirl.create(:question)
      quiz.questions << q1
      expect(quiz.questions.first).to eq q1
    end
  end

  describe '#correct_answers' do
    it 'is a list of quiz correct answers' do
      quiz = FactoryGirl.create(:quiz)
      q1 = FactoryGirl.create(:question)
      correct = FactoryGirl.create(:answer_is_correct)
      incorrect = FactoryGirl.create(:answer_is_not_correct)
      q1.answers = [correct, incorrect]
      quiz.questions << q1
      expect(quiz.correct_answers).to eq [[correct]]
    end
  end

end
