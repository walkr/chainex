.PHONY: test cover bench docs

help:
	@echo
	@echo "USAGE: make [command]"
	@echo
	@echo "COMMANDS:"
	@echo
	@echo "    test    - run tests with coverage"
	@echo "    cover    - run tests with coverage"
	@echo "    bench    - run benchmarks from bench dir"
	@echo

test:
	@mix test

cover:
	@MIX_ENV=test mix coveralls.html

bench:
	@MIX_ENV=test mix bench

docs:
	@mix docs