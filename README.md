# PHAR composer Drone plugin

## Introduction

This plugins allows for creating a standalone PHAR file from a composer project.

## Usage

```yaml
pipeline:
  build-phar:
    image: phpdrone/phar-composer
    output: ghcli.phar
```

## Operation

The plugin will :

 - Move away your current vendor, .git and .drone.yml file
 - Do a `composer install --no-dev` to get a minimal build
 - Run a build
 - Restore your vendor, .git and .drone.yml file

## Result

```composer log
Backing up vendor directory ...
Moving away non-dist material ...
Installing mininal components ...
Loading composer repositories with package information
Installing dependencies from lock file
Package operations: 0 installs, 0 updates, 10 removals
  - Removing squizlabs/php_codesniffer (3.1.1)
  - Removing clue/phar-composer (v1.0.0)
  - Removing herrera-io/box (1.6.1)
  - Removing phine/path (1.1.0)
  - Removing phine/exception (1.0.0)
  - Removing tedivm/jshrink (v1.2.0)
  - Removing knplabs/packagist-api (v1.5.0)
  - Removing doctrine/inflector (v1.2.0)
  - Removing symfony/finder (v2.8.28)
  - Removing symfony/process (v2.8.28)
Generating autoload files
Building PHAR file ...
[1/1] Creating phar ghcli.phar
  - Adding main package
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/"
  - Adding composer base files
  - Adding dependency "clue/stream-filter" from "vendor/clue/stream-filter/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/clue/stream-filter/"
  - Adding dependency "guzzlehttp/guzzle" from "vendor/guzzlehttp/guzzle/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/guzzlehttp/guzzle/"
  - Adding dependency "guzzlehttp/promises" from "vendor/guzzlehttp/promises/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/guzzlehttp/promises/"
  - Adding dependency "guzzlehttp/psr7" from "vendor/guzzlehttp/psr7/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/guzzlehttp/psr7/"
  - Adding dependency "knplabs/github-api" from "vendor/knplabs/github-api/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/knplabs/github-api/"
  - Adding dependency "php-http/cache-plugin" from "vendor/php-http/cache-plugin/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/php-http/cache-plugin/"
  - Adding dependency "php-http/client-common" from "vendor/php-http/client-common/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/php-http/client-common/"
  - Adding dependency "php-http/discovery" from "vendor/php-http/discovery/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/php-http/discovery/"
  - Adding dependency "php-http/guzzle6-adapter" from "vendor/php-http/guzzle6-adapter/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/php-http/guzzle6-adapter/"
  - Adding dependency "php-http/httplug" from "vendor/php-http/httplug/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/php-http/httplug/"
  - Adding dependency "php-http/message" from "vendor/php-http/message/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/php-http/message/"
  - Adding dependency "php-http/message-factory" from "vendor/php-http/message-factory/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/php-http/message-factory/"
  - Adding dependency "php-http/promise" from "vendor/php-http/promise/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/php-http/promise/"
  - Adding dependency "psr/cache" from "vendor/psr/cache/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/psr/cache/"
  - Adding dependency "psr/http-message" from "vendor/psr/http-message/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/psr/http-message/"
  - Adding dependency "psr/log" from "vendor/psr/log/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/psr/log/"
  - Adding dependency "symfony/console" from "vendor/symfony/console/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/symfony/console/"
  - Adding dependency "symfony/debug" from "vendor/symfony/debug/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/symfony/debug/"
  - Adding dependency "symfony/options-resolver" from "vendor/symfony/options-resolver/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/symfony/options-resolver/"
  - Adding dependency "symfony/polyfill-mbstring" from "vendor/symfony/polyfill-mbstring/"
    Adding whole project directory "/drone/src/github.com/gboddin/php-github-cli/vendor/symfony/polyfill-mbstring/"
  - Setting main/stub
    Using referenced shebang "#!/usr/bin/env php"
    Using referenced chmod 0755
    Applying chmod 0755

    OK - Creating ghcli.phar (2537.2 KiB) completed after 33.4s
Restoring state ...
```

## Limitation

You should clean your workspace before building, at
the risk of finding non-dist material in the final PHAR file.

## Credits

- https://github.com/clue/phar-composer for is awesome tool