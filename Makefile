.PHONY: test

export EXAMPLES

test:
	cd tests && go test -v -timeout 60m -run TestApplyNoError/$(EXAMPLES) ./pe_test.go
