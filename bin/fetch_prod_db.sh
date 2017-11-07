sudo service mysql start
server=i7app4.citrin.ch
ssh root@$server "mysqldump facerecog | gzip > facerecog.sql.gz"
scp root@$server:facerecog.sql.gz .
rake db:drop db:create RAILS_ENV=development DISABLE_DATABASE_ENVIRONMENT_CHECK=1
gunzip -c facerecog.sql.gz | rails db -p 
rsync -av root@hub.firemind.ch:/home/dokku/face-recog-server/shared/system/ public/system
