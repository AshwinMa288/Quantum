# This uses the latest Docker image built from the samples repository,
# defined by the Dockerfile in Build/images/samples.
FROM mcr.microsoft.com/quantum/samples:675b15fec8483d9eb5b654cb153d73af5e3a9080

# Mark that this Dockerfile is used with the samples repository.
ENV IQSHARP_HOSTING_ENV=SAMPLES_HOSTED

# Make sure the contents of our repo are in ${HOME}.
# These steps are required for use on mybinder.org.
USER root
COPY . ${HOME}
RUN chown -R ${USER} ${HOME}

# Finish by dropping back to the notebook user.
USER ${USER}
