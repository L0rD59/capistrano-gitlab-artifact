# Capistrano::GitlabArtifact

Gitlab Artifact is a [Custom SCM Plugin](http://capistranorb.com/documentation/advanced-features/custom-scm/) for Capistrano v3


## Installation

```
# Gemfile
gem 'capistrano-gitlab-artifact', '0.0.2'
```

## Usage

Require capistrano-gitlab-artifact in your Capfile

```
# Capfile
require "capistrano/scm/gitlab-artifact"
install_plugin Capistrano::SCM::GitlabArtifact
```


### Settings

```ruby
# Custom "Gitlab Artifact" SCM configuration
set :gitlab_artifact_url, 'https://your.gitlab.com/your-namespace/your-repository/-/jobs/artifacts/gitlab-ci/download?job=build'
set :gitlab_artifact_private_token, 'your-private-token'
```