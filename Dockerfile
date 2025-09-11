FROM rust:1.87 AS builder

RUN apt-get update

RUN apt-get install musl-tools -y

RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /usr/src/app

COPY Cargo.toml Cargo.lock ./

RUN cargo fetch

COPY . .

RUN cargo build --release

FROM alpine:3.20.2

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/target/release/explorer .

CMD ["./explorer"]