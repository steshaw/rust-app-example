package = rust-app-example

env = OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl/include"
cargo = $(env) cargo
debug-env = RUST_BACKTRACE=1 RUST_LOG=$(package)=debug
debug-cargo = $(env) $(debug-env) cargo

.PHONY: default
default: build

.PHONY: clean
clean:
	$(cargo) clean

.PHONY: build
build:
	$(cargo) build

.PHONY: build-release
build-release:
	$(cargo) build --release

.PHONY: clippy
clippy:
	$(cargo) clippy

.PHONY: lint
lint: clippy

.PHONY: run
run: build
	$(cargo) run

.PHONY: run-release
run-release: build
	$(cargo) run --release

.PHONY: install
install:
	$(cargo) install --force

.PHONY: test
test:
	$(cargo) test

.PHONY: test-debug
test-debug:
	$(debug-cargo) test -- --nocapture

#
# Nightly rustfmt required to try `fn_args_layout = 'Vertical'`.
#
.PHONY: fmt
fmt:
	$(cargo) +nightly fmt

.PHONY: watch
watch:
	$(cargo) watch

.PHONY: dev-deps
dev-deps:
	rustup toolchain install nightly
	rustup component add rustfmt --toolchain nightly
	rustup component add clippy
