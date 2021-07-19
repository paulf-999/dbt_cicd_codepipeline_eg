# dbt_cicd_codepipeline_eg

Demo of using DBT tests as a basis for CI/CD, where AWS CodeBuild / CodePipeline have been used as the CI/CD technology.

---

## Contents

1. High-level summary
2. Getting started
    * Prerequisites
    * Installation
    * How-to run
3. Help
4. Folder contents

---

## 1. High-level summary

This demo makes use of DBT tests as a basis for integration testing for CI/CD.

##### Technologies used
* AWS CodeBuild, CodePipeline and SSM for CI / CD
* DBT for integrating CI unit testing

##### Folder contents

| Folder                    | Description                                                                                       |
| --------------------------| --------------------------------------------------------------------------------------------------|
| bin            | Contains the DBT files (to be used as a basis for CI / CD) |
| cfn            | Contains CloudFormation template files |

---

## 2. Getting started

### Prerequisites

* Prior to using AWS CodeBuild (used for CI / CD), you will need to create an OATH token with Git
    * See: https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token
### Installation

#### CI / CD setup, using AWS CodePipeline

To first create a CI / CD pipeline using AWS CodeBuild, run the `Makefile` at the project root. This is just creating a CloudFormation stack, to create the CodeBuild project.

#### 2. DBT setup

* The files used by DBT are within the `bin/` folder, at the project root
* Within `bin/` are is the same file / folder structure I used for my other Git repo, [DBT Setup Automation](https://github.com/paulf-999/dbt_setup_automation)
* So to create a DBT project using these files, navigate to the `bin/` folder at the project root, then do the following:

1. Populate the 4 variables at the top of the script, i.e.:

    * `DBT_PROFILE_NAME`
    * `DBT_PROJECT_NAME`
    * `PROGRAM`
    * and `DBT_MODEL`

2. Create any data model files you wish, underneath the folder `models` (also edit the `schema.yml` file).
3. Similarly, create any desired unit tests within the `tests/` folder.

Following this, run `make`!

Then to test your data model, run `make data_test_model`
### How-to run - see `builspec.yml`

Each time a code change is submitted to Git, it will trigger DBD commands outlined by the CI/CD pipeline. These commands can be seen within the file `buildspec.yml`.

#### Note

Within the `bin/` folder, ignore the `bikestores` folder - this is temporary, whilst still in dev
