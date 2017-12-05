require "capistrano/scm/plugin"

class Capistrano::SCM::GitlabArtifact < Capistrano::SCM::Plugin
  def set_defaults
    set_if_empty :gitlab_artifact_url, ''
    set_if_empty :gitlab_artifact_private_token, ''
  end

  def define_tasks
    eval_rakefile File.expand_path("../tasks/gitlab_artifact.rake", __FILE__)
  end

  def register_hooks
    after "deploy:new_release_path", "gitlab_artifact:create_release"
  end

  def create_release
    on release_roles :all do
      execute :mkdir, "-p", release_path
      execute :wget, "-q -O #{repo_path}/artifact.zip --header=\"PRIVATE-TOKEN: #{fetch(:gitlab_artifact_private_token)}\" #{fetch(:gitlab_artifact_url)}"
      execute :unzip, "-q #{repo_path}/artifact.zip -d #{fetch(:release_path)}/"
    end
  end

end