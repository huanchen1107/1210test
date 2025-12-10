# Change: Add GitHub Integration Test

## Why
Test the GitHub CLI integration and verify the development workflow scripts (startup.sh, ending.sh) work correctly with GitHub operations.

## What Changes
- Verify GitHub CLI is properly installed and configured
- Test git pull/push operations
- Validate the development session workflow

## Impact
- Affected specs: `github` (new capability)
- Affected code: `dev/startup.sh`, `dev/ending.sh`
