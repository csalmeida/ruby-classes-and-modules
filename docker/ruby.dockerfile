# FROM ruby:3.0.3-alpine3.15@sha256:8ec4194e3df279ef459ed06724dd455964defcf49857c161154378a0e4df98a9
FROM ruby:3.0.3@sha256:8999101469defa0278a32d2b2cfc72e735c7f0073165c08520dbd7a3416e04a4

WORKDIR /usr/src/ruby-classes-and-modules

CMD ["irb"]