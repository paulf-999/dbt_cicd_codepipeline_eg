default: create_codebuild_and_codepipeline_instances

AWS_PROFILE=${MY_AWS_PROFILE}
VERSION=1

create_codebuild_and_codepipeline_instances:
	$(info [+] Create an instance of a codebuild service)
	aws cloudformation deploy \
	--profile ${AWS_PROFILE} \
	--stack-name codebuild-and-codepipeline-v${VERSION} \
	--template-file cfn/codebuild-and-codepipeline.yml \
	--capabilities CAPABILITY_IAM \
	--parameter-overrides PipelineName=dbt_cicd_demo \
	ArtifactStoreS3Location= \
	GitRepoOwner=paulf-999 \
	GitRepoName=dbt_cicd_demo \
	OAuthToken=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