{
	subject: [
		{
			name: "ghcr.io/lkhn/sigstore-playground/zig-key"
		}
	]
	predicateType: "https://slsa.dev/provenance/v1"
	predicate: {
		buildDefinition: {
			buildType: "https://actions.github.io/buildtypes/workflow/v1"
			externalParameters: {
				workflow: {
					ref:        =~"^refs/tags/.+$" & !~"^.+alpha|beta|rc[0-9]*$" // Verify it is a git tag (not a branch and commit) and stable version.
					repository: "https://github.com/lkhn/sigstore-playground"
					path:       ".github/workflows/caller_release.yaml"
				}
			}
			internalParameters: {
				github: {
					event_name:          "workflow_dispatch"
					repository_id:       "1045736426"
					repository_owner_id: "10092215"
					runner_environment:  "github-hosted"
				}
			}
			resolvedDependencies: [
				{
					uri: =~"^git\\+https://github.com/lkhn/sigstore-playground@refs/tags/.+$"
				}
			]
		}
		runDetails: {
			builder: {
				id: "https://github.com/lkhn/sscs-reusable-workflows/.github/workflows/reusable_release_container_key.yaml@refs/heads/main"
			}
			metadata: {
				invocationId: =~"^https://github.com/lkhn/sigstore-playground/actions/runs/.+$"
			}
		}
	}
}
