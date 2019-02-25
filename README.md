# microblog

docker build . -t microblog

docker run -it -p 3000:3000 microblog bash

docker exec ruby-microblog rails db:migrate