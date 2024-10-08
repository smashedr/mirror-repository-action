[![Tags](https://img.shields.io/github/actions/workflow/status/smashedr/mirror-repository-action/tags.yaml?logo=github&logoColor=white&label=tags)](https://github.com/smashedr/mirror-repository-action/actions/workflows/tags.yaml)
[![Test](https://img.shields.io/github/actions/workflow/status/smashedr/mirror-repository-action/test.yaml?logo=github&logoColor=white&label=test)](https://github.com/smashedr/mirror-repository-action/actions/workflows/test.yaml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=smashedr_mirror-repository-action&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=smashedr_mirror-repository-action)
[![GitHub Release Version](https://img.shields.io/github/v/release/smashedr/mirror-repository-action?logo=github)](https://github.com/smashedr/mirror-repository-action/releases/latest)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/smashedr/mirror-repository-action?logo=github&logoColor=white&label=updated)](https://github.com/smashedr/mirror-repository-action/graphs/commit-activity)
[![GitHub Top Language](https://img.shields.io/github/languages/top/smashedr/mirror-repository-action?logo=htmx&logoColor=white)](https://github.com/smashedr/mirror-repository-action)
[![GitHub Org Stars](https://img.shields.io/github/stars/cssnr?style=flat&logo=github&logoColor=white)](https://cssnr.github.io/)
[![Discord](https://img.shields.io/discord/899171661457293343?logo=discord&logoColor=white&label=discord&color=7289da)](https://discord.gg/wXy6m2X8wY)

# Mirror Repository Action

Test 2 NEW

-   [Inputs](#Inputs)
-   [Support](#Support)
-   [Contributing](#Contributing)
-   [Development](#Development)

## Inputs

| input    | required     | default    | description                                          |
| -------- | ------------ | ---------- | ---------------------------------------------------- |
| url      | No if `host` | -          | Full URL to Mirror, overrides: `host`/`owner`/`repo` |
| host     | No if `url`  | -          | Full Host to Mirror, example: `https://codeberg.org` |
| owner    | No           | Repo Owner | Repository Owner of Mirror                           |
| repo     | No           | Repo Name  | Repository Name of Mirror                            |
| username | No           | Repo Owner | Username for Authentication to Mirror                |
| password | Yes          | -          | Token or Password for Authentication to Mirror       |

Note: You must provide either a `url` or `host`.

If providing a `host` the `url` is created from `host`/`owner`/`repo` using either provided values or source repository values.

```yaml
name: 'Mirror'

on:
    workflow_dispatch:
    push:
        branches:
            - '**'
        tags:
            - '**'

jobs:
    mirror:
        name: 'Mirror'
        runs-on: ubuntu-latest
        timeout-minutes: 5

        steps:
            - name: 'Checkout'
              uses: actions/checkout@v4
              with:
                  fetch-depth: 0

            - name: 'Mirror to Codeberg'
              id: test
              uses: smashedr/mirror-repository-action@master
              with:
                  url: https://codeberg.org/shaner/codeberg-mirror
                  #host: https://codeberg.org
                  #owner: shaner
                  #repo: codeberg-mirror
                  username: shaner
                  password: ${{ secrets.CODEBERG_TOKEN }}
```

# Support

For general help or to request a feature, see:

-   Q&A Discussion: https://github.com/cssnr/push-artifacts-action/discussions/categories/q-a
-   Request a Feature: https://github.com/cssnr/push-artifacts-action/discussions/categories/feature-requests

If you are experiencing an issue/bug or getting unexpected results, you can:

-   Report an Issue: https://github.com/cssnr/push-artifacts-action/issues
-   Chat with us on Discord: https://discord.gg/wXy6m2X8wY
-   Provide General
    Feedback: [https://cssnr.github.io/feedback/](https://cssnr.github.io/feedback/?app=Push%20Artifacts)

# Contributing

Currently, the best way to contribute to this project is to star this project on GitHub.

Additionally, you can support other GitHub Actions I have published:

-   [VirusTotal Action](https://github.com/cssnr/virustotal-action)
-   [Update Version Tags Action](https://github.com/cssnr/update-version-tags-action)
-   [Update JSON Value Action](https://github.com/cssnr/update-json-value-action)
-   [Parse Issue Form Action](https://github.com/cssnr/parse-issue-form-action)
-   [Mirror Repository Action](https://github.com/cssnr/mirror-repository-action)
-   [Portainer Stack Deploy](https://github.com/cssnr/portainer-stack-deploy-action)
-   [Mozilla Addon Update Action](https://github.com/cssnr/mozilla-addon-update-action)

For a full list of current projects to support visit: [https://cssnr.github.io/](https://cssnr.github.io/)

# Development

1. Install `act`: https://nektosact.com/installation/index.html
2. Run `act -j test`

For advanced using with things like secrets, variables and context see: https://nektosact.com/usage/index.html

You should also review the options from `act --help`

Note, the `.env`, `.secrets` and `.vars` files are automatically sourced with no extra options.
To source `event.json` you need to run act with `act -e event.json`
