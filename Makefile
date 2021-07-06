default: create_codebuild_and_codepipeline_instances

AWS_PROFILE=${MY_AWS_PROFILE}
VERSION=1

create_codebuild_and_codepipeline_instances:
	$(info [+] Create an instance of a codebuild service)
	aws cloudformation deploy \
	--profile ${AWS_PROFILE} \
	--stack-name codebuild-and-codepipeline-v${VERSION} \
	--template-file dms/rds/rds-mssql.yml \
	--parameter-overrides PipelineName=dbt_cicd_demo \
	ArtifactStoreS3Location= \
	OAuthToken=