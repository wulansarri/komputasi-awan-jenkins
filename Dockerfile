FROM alpine:latest
RUN echo "Hello from Dockerfile!" > /hello.txt
CMD ["cat", "/hello.txt"]
