all: format doc

format:
	terraform fmt
	find ./* -type d -exec sh -c "cd {} && terraform fmt" \;

doc:
	terraform-docs markdown table --output-file README.md --output-mode inject .
