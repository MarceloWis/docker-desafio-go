FROM golang as builder
RUN mkdir /build
ADD main.go /build/
WORKDIR /build
RUN CGO_ENABLED=0 GOOS=linux go build -a main.go


FROM scratch
COPY --from=builder /build/main .

ENTRYPOINT [ "./main" ]
