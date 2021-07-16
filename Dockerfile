FROM julia:1.6.1-buster

COPY 0setup.jl /0setup.jl
RUN julia /0setup.jl
COPY 1setup.jl /1setup.jl
RUN julia /1setup.jl

WORKDIR /workdir

CMD ["julia"]
