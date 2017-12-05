# This trick lets us access the Git plugin within `on` blocks.
gitlab_artifact_plugin = self

# The namespace can be whatever you want, but its best
# to choose a name that matches your plugin name.
namespace :gitlab_artifact do

  desc "Create release"
  task :create_release do
    on release_roles :all do
      gitlab_artifact_plugin.create_release
    end
  end

end
