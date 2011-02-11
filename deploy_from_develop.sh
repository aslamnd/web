git pull origin develop 
git push origin develop 
git checkout master
git pull origin master
git merge develop
git push origin master 
heroku maintenance:on
compass compile
rake jammit_s3
git push heroku master
heroku maintenance:off
