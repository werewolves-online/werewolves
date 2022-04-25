# How to build and run
- Clone or fork then clone
- [Follow this page](https://docs.flutter.dev/get-started/install) to install flutter
- run `flutter doctor` and make sure flutter version is `2.10.4` (Other versions might work but if you see errors please change flutter version and try again before [reporting an issue](https://github.com/werewolves-online/werewolves/issues/new))
- go to the folder `werewolves` and run `flutter run` or open it in [VSCode](https://code.visualstudio.com/) and hit the run button.

# How to make a PR
- make sure you have the up to date main branch (run `git fetch`)
- create a new branch and make your changes
- run `flutter test` and make sure no failing tests
- commit your changes (make small PRs that consist of 1 commit only, leave todo comments as future tasks if needed)
- rebase the main branch [merge vs rebase](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)
- push your branch and make the PR
