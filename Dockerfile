FROM ruby:2.7.4

ENV INSTALL_PATH /opt/app
RUN mkdir -p ${INSTALL_PATH}

WORKDIR ${INSTALL_PATH}

COPY . ${INSTALL_PATH}

RUN bundle install

EXPOSE 3000