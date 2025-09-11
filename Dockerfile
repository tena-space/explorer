FROM rust:1.87-alpine3.22 AS builder

RUN apk add --no-cache \
    build-base \
    cmake \
    musl-dev \
    pkgconfig \
    openssl-dev \
    openssl-libs-static

ENV RUSTFLAGS="-C target-feature=-crt-static -C link-arg=-s"
ENV CARGO_BUILD_TARGET="x86_64-unknown-linux-musl"
RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /app

COPY . .

RUN cargo fetch

COPY . .

RUN cargo build --release --target x86_64-unknown-linux-musl

FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/target/release/explorer .

CMD ["./explorer"]