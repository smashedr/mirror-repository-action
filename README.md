[![Tags](https://img.shields.io/github/actions/workflow/status/smashedr/mirror-repository-action/tags.yaml?logo=github&logoColor=white&label=tags)](https://github.com/smashedr/mirror-repository-action/actions/workflows/tags.yaml)
[![Test](https://img.shields.io/github/actions/workflow/status/smashedr/mirror-repository-action/test.yaml?logo=github&logoColor=white&label=test)](https://github.com/smashedr/mirror-repository-action/actions/workflows/test.yaml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=smashedr_mirror-repository-action&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=smashedr_mirror-repository-action)
[![GitHub Release Version](https://img.shields.io/github/v/release/smashedr/mirror-repository-action?logo=github)](https://github.com/smashedr/mirror-repository-action/releases/latest)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/smashedr/mirror-repository-action?logo=github&logoColor=white&label=updated)](https://github.com/smashedr/mirror-repository-action/graphs/commit-activity)
[![GitHub Top Language](https://img.shields.io/github/languages/top/smashedr/mirror-repository-action?logo=htmx&logoColor=white)](https://github.com/smashedr/mirror-repository-action)
[![GitHub Org Stars](https://img.shields.io/github/stars/cssnr?style=flat&logo=github&logoColor=white)](https://cssnr.github.io/)
[![Discord](https://img.shields.io/discord/899171661457293343?logo=discord&logoColor=white&label=discord&color=7289da)](https://discord.gg/wXy6m2X8wY)

# Mirror Repository Action

* [Inputs](#Inputs)
* [Outputs](#Outputs)
* [Development](#Development)

## Inputs

| input       | required | default | description |
|-------------|----------|---------|-------------|
| coming soon | No       | -       | -           |

```yaml
  - name: "PY Test Action"
    uses: smashedr/mirror-repository-action@master
    with:
      url: https://codeberg.org/shaner/private
      #host: https://codeberg.org
      owner: shaner
      repo: private
      username: shaner
      password: ${{ secrets.CODEBERG_TOKEN }}
```

## Outputs

| output | description    |
|--------|----------------|
| time   | Resulting Time |

```yaml
  - name: "PY Test Action"
    id: test
    uses: smashedr/mirror-repository-action@master
    with:
      url: https://codeberg.org/shaner/private
      #host: https://codeberg.org
      owner: shaner
      repo: private
      username: shaner
      password: ${{ secrets.CODEBERG_TOKEN }}

  #- name: "Echo Output"
  #  run: |
  #    echo '${{ steps.test.outputs.time }}'
```

# Development

1. Install `act`: https://nektosact.com/installation/index.html
2. Run `act -j test`

For advanced using with things like secrets, variables and context see: https://nektosact.com/usage/index.html

You should also review the options from `act --help`

Note, the `.env`, `.secrets` and `.vars` files are automatically sourced with no extra options.
To source `event.json` you need to run act with `act -e event.json`
