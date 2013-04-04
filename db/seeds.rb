User.delete_all

u1 = User.create(:name => 'Sergey Brin', :email => 's@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Manhattan, NYC', :phone => '917-922-2816' )
u2 = User.create(:name => 'God', :email => 'god@gmail.com', :password => 'a', :password_confirmation => 'a', :address => 'Brooklyn, NY', :is_house => true )

r = Result.create
q1 = Quiz.create
q2 = Quiz.create

u1.results << r
q1.results << r

