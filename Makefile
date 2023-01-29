docs:
	@sourcedocs generate -a --min-acl private -r

swiftlint:
	@swiftlint --autocorrect
