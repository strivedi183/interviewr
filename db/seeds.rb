Answer.delete_all
Question.delete_all
Quiz.delete_all
Result.delete_all
Tag.delete_all
User.delete_all

u1 = User.create(:name => 'Sergey Brin', :email => 's@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Manhattan, NYC', :phone => '917-922-2816' )
u2 = User.create(:name => 'God', :email => 'god@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Brooklyn, NY', :is_house => true )


# This block is to set up a sample quiz
q1 = Quiz.create(:name => 'Quiz 1', :num_pass => 2)
u2.quizzes << q1
question1 = Question.create(:prompt => 'This is Question 1')
a1 = Answer.create(:name => 'Choice 1', :is_correct => true)
a2 = Answer.create(:name => 'Choice 2', :is_correct => false)
a3 = Answer.create(:name => 'Choice 3', :is_correct => true)
a4 = Answer.create(:name => 'Choice 4', :is_correct => false)
question1.answers << a1 << a2 << a3 << a4
question2 = Question.create(:prompt => 'This is Question 2')
a5 = Answer.create(:name => 'Choice 1', :is_correct => false)
a6 = Answer.create(:name => 'Choice 2', :is_correct => false)
a7 = Answer.create(:name => 'Choice 3', :is_correct => true)
a8 = Answer.create(:name => 'Choice 4', :is_correct => true)
question2.answers << a5 << a6 << a7 << a8
question3 = Question.create(:prompt => 'This is Question 3')
a9 = Answer.create(:name => 'Choice 1', :is_correct => true)
a10 = Answer.create(:name => 'Choice 2', :is_correct => false)
a11 = Answer.create(:name => 'Choice 3', :is_correct => false)
a12 = Answer.create(:name => 'Choice 4', :is_correct => true)
question3.answers << a9 << a10 << a11 << a12
q1.questions << question1 << question2 << question3
# End Block
