# [Git](https://en.wikipedia.org/wiki/Git)

## Contents
- [Overview](#overview)
- [ReadMes](#readmes)
  - [Templates](#templates)
    - [All Sections](#all-sections)
    - [Basic](#basic)

## Overview
[Git](https://en.wikipedia.org/wiki/Git), like [Linux](https://www.linux.org/), was created by [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds). It was originally meant as a means of [version control](https://en.wikipedia.org/wiki/Version_control) for the [Linux kernel](https://en.wikipedia.org/wiki/Linux_kernel). It's come to be the most common [Distributed version control](https://en.wikipedia.org/wiki/Distributed_version_control) in the world, and is my [source control](https://en.wikipedia.org/wiki/Version_control) mechanism of choice.

## Commits

### Purpose
- Since 2020, GitHub has deprecated password authentication in favor of more secure methodologies. Since then, I prefer to use `ssh` as my means of authentication.
- Once `ssh` has been configured locally for use with `git`, the following commands are useful for interacting with GitHub repositories.

### Cloning with `ssh`

#### Overview

#### Command
```bash
local username=""
local repo=""
git clone ssh://git@github.com:${username}/${repo}
```

## [ReadMes](https://en.wikipedia.org/wiki/README)

### Description
[README](https://en.wikipedia.org/wiki/README) files play a huge role in how our projects are perceived by the outside world. Often, the hardest part is knowing where to start, and what to include. To remedy this, I studied dozens of [READMEs](https://en.wikipedia.org/wiki/README), and devised the following template, which I paste into every new project to get me started. Not all sections will apply to all projects, so I usually prune some off as I go along.

### Templates

#### All Sections

```markdown
# ![Logo]()

## Contents
- [Overview](#overview)
- [Demo](#demo)
- [Development Philosophy](#development-philosophy)
- [Stack](#stack)
- [Configure](#configure)
- [Build](#build)
- [Test](#test)
- [Contribute](#contribute)
- [License](#license)
- [Features](#features)
- [Features To Do](#features-to-do)

## Overview

## Demo
[]()

## Development Philosophy

## Stack

### Server
- []()
- []()
- []()

### Client
- []()
- []()
- []()

### Test
- []()
- []()
- []()

## Configure

### `\`

## Build

### Local
``

### Production
``

## Test
``

## Contribute
If you have feature suggestions, please message me here. If you'd like to submit a pull request, please feel free and I'll merge it at my earliest convenience!

## License
This project is provided under the [`MIT`](https://opensource.org/licenses/MIT) licence and I hereby grant rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software without limitation, provided the resulting software also carries the same open-source licensing statement.

## Features

### Use Case 1

### Screenshot
![Screenshot]()

### Use Case 2

### Screenshot
![Screenshot]()

## Features To Do
- [] New Feature
```

#### Basic

```markdown
# ![Logo]()

## Contents
- [Overview](#overview)
- [Demo](#demo)
- [Stack](#stack)

## Overview

## Demo
[]()

## Stack
- []()
- []()
- []()
```

