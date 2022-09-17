# pre-commit-docker-php

This repository provides [pre-commit](https://pre-commit.com)
hooks useful to all kinds of PHP projects. The hooks run inside
a Docker container to make them work on Windows, MacOS and
Linux and without developers having to manually install
a PHP interpreter and the tools on their development machines.

## Requirements

None apart from a Docker environment capable of running Linux
containers. On Windows ensure your Docker is configured to run
Linux containers and not Windows containers.

## Provided hooks

### php-lint
Runs `php -l` (i.e. syntax check only) over all staged files and stops at first error.

```yaml
-   repo: https://github.com/Corristo/pre-commit-docker-php
    rev: 'v1.0' # or replace with some other version
    hooks:
    -   id: php-lint
```

### phpcs
Runs the [PHP Codesniffer](https://github.com/squizlabs/PHP_CodeSniffer) over all staged files.

:information_source: By default, no command-line arguments other than the files to check are provided. You can pass any argument that `phpcs` accepts via `args` (see example below).

```yaml
-   repo: https://github.com/Corristo/pre-commit-docker-php
    rev: 'v1.0' # or replace with some other version
    hooks:
    -   id: phpcs
    -   args: ['--standard=PSR12'] # Pass any args you like to phpcs
```

### phpcbf
Runs the [PHP Codesniffer (Code Beautifier and Fixer)](https://github.com/squizlabs/PHP_CodeSniffer) over all staged files, fixing found issue in-place.

:information_source: By default, no command-line arguments other than the files to check are provided. You can pass any argument that `phpcs` accepts via `args` (see example below).

```yaml
-   repo: https://github.com/Corristo/pre-commit-docker-php
    rev: 'v1.0' # or replace with some other version
    hooks:
    -   id: phpcbf
    -   args: ['--standard=PSR12'] # Pass any args you like to phpcbf
```

### php-cs-fixer
Runs the [PHP Coding Standards Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)
over all staged files, fixing found issue in-place.

:warning: The PHP Coding Standards Fixer requires a [config file](https://github.com/FriendsOfPHP/PHP-CS-Fixer/blob/master/doc/config.rst) to run with multiple input files. Since pre-commit always passes a list of files to check that config file is mandatory. The default arguments provided by this hook assume your config file to be named `.php-cs-fixer.dist.php` and to reside in the project's root directory. If that is not the case you can overwrite the default arguments. If you do, ensure to add `fix` as the first argument (see example below).


```yaml
-   repo: https://github.com/Corristo/pre-commit-docker-php
    rev: 'v1.0' # or replace with some other version
    hooks:
    -   id: php-cs-fixer
#       args: ['fix', '--config=<path-to-your-config>']
```

### phpstan
Runs the [PHP Static Analysis Tool](https://github.com/phpstan/phpstan) over all staged files

:information_source: The default level of checks used by this pre-commit hook is 0, but the hook respects
any [config file](https://phpstan.org/config-reference#config-file) located at the project root dir, which
is the recommended way to configure this hook. If for some reason you'd like to change the command-line
arguments passed to `phpstan` remember to make `analyze` the first argument (see example below).

```yaml
-   repo: https://github.com/Corristo/pre-commit-docker-php
    rev: 'v1.0' # or replace with some other version
    hooks:
    -   id: phpstan
        args: ['analyze', '--level', '6'] # Pass any args you like to phpstan
```
