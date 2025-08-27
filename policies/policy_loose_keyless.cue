{
	predicateType: "https://slsa.dev/provenance/v1"
	subject: [
		{
			name: "ghcr.io/lkhn/sigstore-playground/zig-keyless"
		}
	]
	predicate: {
		buildDefinition: {
			buildType: "https://actions.github.io/buildtypes/workflow/v1"
			externalParameters: {
				workflow: {
					ref:        =~"^refs/tags/.+$" & !~"^.+alpha|beta|rc[0-9]*$" // Verify it is a git tag (not a branch and commit) and stable version.
					repository: "https://github.com/lkhn/sigstore-playground"
					path:       ".github/workflows/caller_release.yaml" // Verify caller workflow.
				}
			}
			internalParameters: {
				github: {
					runner_environment: "github-hosted" // Verify runner is GitHub hosted.
				}
			}
		}
		runDetails: {
			builder: {
				id: =~"^https://github.com/lkhn/sscs-reusable-workflows/.github/workflows/.+$" // Verify location of reusable workflow.
			}
		}
	}
}
