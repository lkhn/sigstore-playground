{
	subject: [
		{
			name: "ghcr.io/lkhn/sigstore-playground/zig-keyless"
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
				// Scenario: Caller workflow is compromised to call different reusable workflow:
				id: "https://github.com/lkhn/sscs-revsable-workflows/.github/workflows/reusable_release_container_keyless.yaml@refs/heads/main"
				//                                  ^ The "u" is replaced with "v".
			}
			metadata: {
				invocationId: =~"^https://github.com/lkhn/sigstore-playground/actions/runs/.+$"
			}
		}
	}
}
