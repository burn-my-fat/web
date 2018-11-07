FROM gruz0/burn_my_fat:0.2
MAINTAINER Alexander Kadyrov <gruz0.mail@gmail.com>

WORKDIR /app
COPY . /app
RUN bundle install -j $(nproc) --quiet

EXPOSE 2300
ENTRYPOINT ["bundle", "exec"]
