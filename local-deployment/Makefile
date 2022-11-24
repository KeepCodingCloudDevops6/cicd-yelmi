
.DEFAULT := help

help:
	@echo '  Available commands                                      '
	@echo '  push             push latest folder changes to s3 bucket'
	@echo '  clean             remove bucket with all existing files'

push:
	cd .. && cd terraform && \
	terraform apply -auto-approve


clean:
	cd .. && cd terraform && \
	terraform destroy -auto-approve
