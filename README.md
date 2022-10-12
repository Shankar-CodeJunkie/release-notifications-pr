# release-notifications-pr
A github action to publish release notifications on Pull Request. The github action runs only after every successful github release.

# Motivation:
Developers who work on open source repositories normally want to know on which release their pull request had been merged.
They normally get that information using the git cli commands.  We thought that it will be helpful for developers, if all the pull
request has that information automatically in it. Hence, we created a githubaction that prints the release information on all 
the qualifying pull request. With this, the developers can get to know on which release they work had been used/merged.

# How to use this action in your project:

1. Go to Action tab
2. Click on custom action.
3. The github UI will open a YAML editor on the window, and you can use the below sample to use the action

Please use the below sample yaml instruction to add a custom action on your github repo


```
# This is a basic workflow to help you get started with Actions

name: <A name of your choice>
    
# Controls when the workflow will run
on:
  # Triggers the workflow on push or pull request events but only for the "main" branch
  release:
    types: [published]

  # Allows you to run this workflow manually from the Actions tab
  workflow_call:
    secrets:
      APP_ID:
        required: false
      APP_PRIVATE_KEY:
        required: true
      ADD_TO_PROJECT_PAT:
        required: true
  
# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@main
      - name: release-notifications-pr
        uses: Shankar-CodeJunkie/release-notifications-pr@v1.0.2
        with: 
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          OWNER: '<githubownername>'
          REPO_NAME: '<githubreponame>'
          enabled: true
        env:
          ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}  
     

```

![bot-msg](images/pullrequest-img.jpg?raw=true "Pull request with release details commented on it")
