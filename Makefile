.PHONY: terra-dev-apply
terra-dev: 
	$(info -- terraform dev apply)
	terraform workspace select dev
	terraform 
