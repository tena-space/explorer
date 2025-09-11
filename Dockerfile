FROM rust:1.87-alpine3.22 AS builder

RUN apk add --no-cache \
    build-base \
    cmake \
    musl-dev \
    pkgconfig \
    openssl-dev \
    openssl-libs-static

ARG TARGET=x86_64-unknown-linux-musl
RUN rustup target add $TARGET

WORKDIR /app

COPY . .

RUN cargo fetch --target $TARGET

ENV RUSTFLAGS="-C target-feature=-crt-static -C link-arg=-s"
RUN cargo build --release --target $TARGET

FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/explorer .

RUN chmod +x ./explorer

CMD ["./explorer"]
