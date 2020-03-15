== README

#HOW TO USE:

Do the same way we did for our homework. On your Amazon Cloud9:

>>On github

create a new branch.

>>On Amazon Cloud9

rvm use 2.4.0

git clone -b <YOUR_BRANCH> <THIS_REPOSITORY_URL>

bundle install --without production

bundle exec rake db:setup

rails server -p $PORT -b $IP
