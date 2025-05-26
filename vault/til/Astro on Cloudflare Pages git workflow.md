
[https://developers.cloudflare.com/pages/configuration/git-integration/github-integration/#skipping-a-build-via-a-commit-message](https://developers.cloudflare.com/pages/configuration/git-integration/github-integration/#skipping-a-build-via-a-commit-message)

Workflow, when working on larger chunk of work, need to save progress before testable / stable state

1. `git add -A`
2. `git commit -m \"\[CF-Pages-Skip\] WIP\" && git push`

Skips pages' auto-build. Not strictly necessary, but don't need an email about a failed build if I know the branch is unstable

Once complete or at a stable / testable checkpoint

1. `git rebase -i HEAD~{{ n skipped commits }}`
2. reword first, squash remaining
3. `git push --force`