Answer.delete_all
Question.delete_all
Quiz.delete_all
Result.delete_all
Tag.delete_all
User.delete_all

u1 = User.create(:name => 'Sergey Brin', :email => 's@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Manhattan, NYC', :phone => ENV['PHONE'], :balance => 500 )
u2 = User.create(:name => 'Larry Page', :email => 'l@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Manhattan, NYC', :phone => ENV['PHONE'], :balance => 500 )
u3 = User.create(:name => 'Eric Schmidt', :email => 'e@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Manhattan, NYC', :phone => ENV['PHONE'], :balance => 500 )
u4 = User.create(:name => 'Mark Zuckerburg', :email => 'm@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Manhattan, NYC', :phone => ENV['PHONE'], :balance => 500 )
h1 = User.create(:name => 'God', :email => ENV['EMAIL'], :password => 'a', :password_confirmation => 'a', :address => 'Brooklyn, NY', :phone => ENV['PHONE'], :is_house => true, :balance => 1000 )


t1  = Tag.create(name: 'love')
t2  = Tag.create(name: 'passion')
t3  = Tag.create(name: 'techniques')
t4  = Tag.create(name: 'back-end')
t5  = Tag.create(name: 'romance')
t6  = Tag.create(name: 'beginners')
t7  = Tag.create(name: 'spicy')
t8  = Tag.create(name: 'hard')
t9  = Tag.create(name: 'expert')
t10 = Tag.create(name: 'front-end')

# This block is to set up a sample quiz
q1 = Quiz.create(:name => 'Intro to Seduction', :num_pass => 2, :cost => 5)
q1.tags = [t1, t2, t3, t4, t5, t10, t7]
h1.quizzes << q1
question1 = Question.create(:prompt => 'What is the fastest way to the heart of your beloved?')
a1 = Answer.create(:name => 'Soft whispering', :is_correct => true)
a2 = Answer.create(:name => 'The express train', :is_correct => false)
a3 = Answer.create(:name => 'Thoughtfulness', :is_correct => true)
a4 = Answer.create(:name => 'Stale bread', :is_correct => false)
question1.answers << a1 << a2 << a3 << a4
question2 = Question.create(:prompt => 'When should one declare ones romantic intentions?')
a5 = Answer.create(:name => 'On a 6am phone call', :is_correct => false)
a6 = Answer.create(:name => 'As a replacement for punctuation', :is_correct => false)
a7 = Answer.create(:name => 'Only when the time is right', :is_correct => true)
a8 = Answer.create(:name => 'Not when drinking heavily', :is_correct => true)
question2.answers << a5 << a6 << a7 << a8
question3 = Question.create(:prompt => 'What do you do when love has left?')
a9 = Answer.create(:name => 'You hunt it down, like a hungry cheetah', :is_correct => true)
a10 = Answer.create(:name => 'You let it go', :is_correct => false)
a11 = Answer.create(:name => 'You shrug and express ambivalence', :is_correct => false)
a12 = Answer.create(:name => 'You howl at the moon until the pain eases', :is_correct => true)
question3.answers << a9 << a10 << a11 << a12
q1.questions << question1 << question2 << question3
# End Block

# This block is to set up a sample quiz
q2 = Quiz.create(:name => 'Rails Intermediate', :num_pass => 2, :cost => 10)
q2.tags = [t1, t8, t10 ]
h1.quizzes << q2
question4 = Question.create(:prompt => 'This is Question 1')
a13 = Answer.create(:name => 'Choice 1', :is_correct => true)
a14 = Answer.create(:name => 'Choice 2', :is_correct => false)
a15 = Answer.create(:name => 'Choice 3', :is_correct => true)
a16 = Answer.create(:name => 'Choice 4', :is_correct => false)
question4.answers << a13 << a14 << a15 << a16
question5 = Question.create(:prompt => 'This is Question 2')
a17 = Answer.create(:name => 'Choice 1', :is_correct => false)
a18 = Answer.create(:name => 'Choice 2', :is_correct => false)
a19 = Answer.create(:name => 'Choice 3', :is_correct => true)
a20 = Answer.create(:name => 'Choice 4', :is_correct => true)
question5.answers << a17 << a18 << a19 << a20
question6 = Question.create(:prompt => 'This is Question 3')
a21 = Answer.create(:name => 'Choice 1', :is_correct => true)
a22 = Answer.create(:name => 'Choice 2', :is_correct => false)
a23 = Answer.create(:name => 'Choice 3', :is_correct => false)
a24 = Answer.create(:name => 'Choice 4', :is_correct => true)
question6.answers << a21 << a22 << a23 << a24
q2.questions << question4 << question5 << question6
# End Block

# This block is to set up a sample quiz
q3 = Quiz.create(:name => 'Between the Sheets', :num_pass => 2, :cost => 100)
q3.tags = [t2, t3, t4, t5, t6]
h1.quizzes << q3
question4 = Question.create(:prompt => 'This is Question 1')
a25 = Answer.create(:name => 'Choice 1', :is_correct => true)
a26 = Answer.create(:name => 'Choice 2', :is_correct => false)
a27 = Answer.create(:name => 'Choice 3', :is_correct => true)
a28 = Answer.create(:name => 'Choice 4', :is_correct => false)
question4.answers << a25 << a26 << a27 << a28
question5 = Question.create(:prompt => 'This is Question 2')
a29 = Answer.create(:name => 'Choice 1', :is_correct => false)
a30 = Answer.create(:name => 'Choice 2', :is_correct => false)
a31 = Answer.create(:name => 'Choice 3', :is_correct => true)
a32 = Answer.create(:name => 'Choice 4', :is_correct => true)
question5.answers << a29 << a30 << a31 << a32
question6 = Question.create(:prompt => 'This is Question 3')
a33 = Answer.create(:name => 'Choice 1', :is_correct => true)
a34 = Answer.create(:name => 'Choice 2', :is_correct => false)
a35 = Answer.create(:name => 'Choice 3', :is_correct => false)
a36 = Answer.create(:name => 'Choice 4', :is_correct => true)
question6.answers << a33 << a34 << a35 << a36
q3.questions << question4 << question5 << question6
# End Block

#
r1 = Result.create(:quiz_id => q1.id, :user_id => u1.id, :num_correct => 1, :has_started => true)
r2 = Result.create(:quiz_id => q1.id, :user_id => u2.id, :num_correct => 2, :has_started => true)
r3 = Result.create(:quiz_id => q1.id, :user_id => u3.id, :num_correct => 3, :has_started => true)
r4 = Result.create(:quiz_id => q1.id, :user_id => u4.id, :num_correct => 1, :has_started => true)
r5 = Result.create(:quiz_id => q1.id, :user_id => u1.id, :num_correct => 2, :has_started => true)
r6 = Result.create(:quiz_id => q1.id, :user_id => u2.id, :num_correct => 3, :has_started => true)
r7 = Result.create(:quiz_id => q3.id, :user_id => u3.id, :num_correct => 1, :has_started => true)
r8 = Result.create(:quiz_id => q2.id, :user_id => u4.id, :num_correct => 2, :has_started => true)
#