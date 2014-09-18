# Contributing

  1. Fork the repository.
  2. Create a topic branch.
  3. Setup your environment running `script/bootstrap`
  4. Add tests for your unimplemented feature or bug fix.
  5. Run `script/test`. If your tests pass return to step 3.
  6. Implement your feature or bug fix.
  7. Run `script/test`. If your tests fail return to step 5.
  8. Add documentation for your feature or bug fix.
  9. Update CHANGELOG file to reflect your changes
  10. Add, commit, and push your changes. For documentation-only fixes, please add `[ci skip]` to your commit message to avoid needless CI builds.
  11. Submit a pull request.

## Versioning
This library aims to adhere to [Semantic Versioning 2.0.0](http://semver.org/). Violations of this scheme should be reported as bugs. Specifically, if a minor or patch version is released that breaks backward compatibility, that version should be immediately yanked and/or a new version should be immediately released that restores compatibility.
