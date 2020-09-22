# Inclusivelint Github Actions

## Overview

This repo aims to make it easier for users to run the [inclusivelint](https://github.com/inclusivelint/inclusivelint)
project as part of your github action pipeline. It follows the official Github guidance to create a Docker action
that can be found [here](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action).

## Using it as part of the pipeline (private action)

To use it as part of you github pipeline, you can follow the example we have as the action for this repository, which
is explained below:

``` yaml
on: [push]

jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: Action testing job
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      
      - name: Run inclusivelint
        uses: ./
        id: inclusivelint
```

The yaml show how its like to run on a ubuntu machine every time a code is push to the
remote. The pipeline will always need to do the checkout action, this way the step will
have the code that is on the repo (which will be located on the $GITHUB_WORKSPACE).
Once the repo is cloned, the action will run on all the repo. 

## Using it as part of the pipeline (public action from github action)

To use it as part of you github pipeline, you can follow the example we have as the action for this repository, which
is explained below:

``` yaml
on: [push]

jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: Action testing job
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      
      - name: Run inclusivelint from Marketplace
        uses: 'inclusivelint/inclusivelint-github-actions@0.0.1'
```

In this case, the yaml is using the public action from github marketplace. It runs
exactly like the private one, the difference is that you don't need to have the action
code the repo you want to run inclusivelint.
