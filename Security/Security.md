# Security

## Contents
- [Overview](#overview)
- [Passwords](#passwords)
  - [Secure Formula](#secure-formula)
  - [Safe Symbols](#safe-symbols)
- [Container Encryption](#container-encryption)
  - [Using `Veracrypt`](#using-veracrypt)
  - [Using `Zip`](#zip)
- [File Encryption](#file-encryption)
  - [`Zip`](#zip)

## Overview
In our increasingly antagonistic web landscape, security protocols are the most important defensive tool we have at our disposal. That said, I see most average users making all the wrong decisions when it comes to their [passwords](https://en.wikipedia.org/wiki/Password), [encryption](https://en.wikipedia.org/wiki/Encryption), and more. The below sections outline some best practices regarding security in today's computer age.

## Passwords

### Description
Astoundingly, with all the [biometrics](https://en.wikipedia.org/wiki/Biometrics) solutions available, passwords still typically stand as our first line off defense in securing our data. The problem I see, is that we were all incorrecrtly taught how to create a secure password in the 1990's, and those habits have stuck around. People tend to concoct some confusing solution like `P@ssW0Rd`, which is easy for a computer to guess, and difficult for a human to remember. According to [GRC's Password Haystack](https://www.grc.com/haystack.htm), the aforementioned password could be cracked in 1.12 minutes, in a worst-case [Massive Cracking Array](https://en.wikipedia.org/wiki/Brute-force_attack) scenario. Using the below formula would result in an easy-to-remember password like `DotSatOurCat@9`, which would take 15.67 thousand centuries in the same scenario. This amount of time will easily tide us over until the promise of [quantum computers](https://en.wikipedia.org/wiki/Quantum_computing) render all [text passwords](https://en.wikipedia.org/wiki/Password) obsolete.

### Secure Formula

#### Minimum Requirements
- 14 characters
- 4 three-letter words
- 1 lower case letter
- 1 upper case letter
- 1 number
- 1 [symbol](#safe-symbols)

#### Safe Symbols
```text
@ ! $ % + / ~
```

## Container Encryption

### Description
When I want to encrypt multiple files under one [password](https://en.wikipedia.org/wiki/Password), encrypted containers are very useful. Although you can easily [password-protect](https://en.wikipedia.org/wiki/Password) a [zip](https://en.wikipedia.org/wiki/Zip_(file_format)) file, I find [Veracrypt](https://www.veracrypt.fr/) to be the [gold-standard](https://en.wikipedia.org/wiki/Gold_standard), and I usually go that route.

### Using [Veracrypt](https://www.veracrypt.fr/)

#### Description
This is best accomplished via the [Veracrypt](https://www.veracrypt.fr/) [GUI](https://en.wikipedia.org/wiki/Graphical_user_interface), but you can also launch a [CLI](https://en.wikipedia.org/wiki/Command-line_interface) [wizard](https://en.wikipedia.org/wiki/Wizard_(software)) with the following command.

#### Create a New [Container](veracrypt.fr/en/Beginner%27s%20Tutorial.html)
```bash
veracrypt -t -c
```

### Using [Zip](https://en.wikipedia.org/wiki/Zip_(file_format))

#### Description
The [Zip](https://en.wikipedia.org/wiki/Zip_(file_format)) [CLI](https://en.wikipedia.org/wiki/Command-line_interface) utility offers a simple way to [password-protect](https://en.wikipedia.org/wiki/Password) an [archive](https://en.wikipedia.org/wiki/Archive_file#Archive_formats). I always recommend using the [Hidden Password Promt](#hidden-password-prompt) method for better security.

#### Hidden Password Prompt
```bash
zip -e out.zip in-dir/
```

#### In-Line Password
```bash
zip -p DotSatOurCat@9 out.zip in-dir/
```

## File Encryption

### Description
I lean on [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) whenever I need to encrypt a single [plain text](https://en.wikipedia.org/wiki/Plain_text) file. I usually configure it to use the [blowfish 2](https://vim.fandom.com/wiki/Encryption) [algorithm](https://en.wikipedia.org/wiki/Encryption), for best security. This method works by creating a new [encrypted](https://en.wikipedia.org/wiki/Encryption) file, into which I paste the content I want to encrypt.

### Using [Vim](https://www.vim.org/)
```bash
vim -x file.md
```

