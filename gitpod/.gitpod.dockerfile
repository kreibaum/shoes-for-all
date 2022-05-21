FROM gitpod/workspace-postgres

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && dpkg -i erlang-solutions_2.0_all.deb \
    && apt-get update \
    && apt-get install esl-erlang \
    && apt-get install elixir \
    && apt-get install inotify-tools -y \
    && mix local.hex --force \
    && mix local.rebar --force


# Allow gitpod group to edit 
RUN true \
	&& chown -R root:gitpod /home/gitpod/.mix \
    && chmod -R g+rw /home/gitpod/.mix