# [Firebase](https://firebase.google.com)

## Contents

- [Overview](#overview)
- [Realtime Database Rules](#realtime-database-rules)

## Overview

[Firebase](https://firebase.google.com/) is a [Google](https://about.google/) product, which offers a cohesive platform for performing back-end tasks. I use it for the [Realtime Database](https://firebase.google.com/docs/database), [Authentication](https://firebase.google.com/docs/auth), [File Storage](https://firebase.google.com/docs/storage), and [Hosting](https://firebase.google.com/docs/hosting). It makes all of those exceedingly simple, play well with [Angular](https://angular.io/), and can eliminate the need to build a back-end for simple apps.

## [Realtime Database](https://firebase.google.com/docs/database) Rules

### Description

Below are a variety of rules, for use with [Firebase](https://firebase.google.com) [Realtime Database](https://firebase.google.com/docs/database).

### No security

```json
{
  "rules": {
    ".read": true,
    ".write": true
  }
}
```

### Full security

```json
{
  "rules": {
    ".read": false,
    ".write": false
  }
}
```

### Only authenticated users can access/write data

```json
{
  "rules": {
    ".read": "auth != null",
    ".write": "auth != null"
  }
}
```

### User can only access their own data

```json
{
  "rules": {
    "posts": {
      "$uid": {
        ".read": "$uid === auth.uid",
        ".write": "$uid === auth.uid"
      }
    }
  }
}
```

### Validate user is moderator, from different DB location

```json
{
  "rules": {
    "posts": {
      "$uid": { ".write": "root.child('users').child('moderator').val() === true"
      }
    }
  }
}
```


### Validate `string` datatype and `length` range

```json
{
  "rules": {
    "posts": {
      "$uid": {
        ".validate": "newData.isString() 
          && newData.val().length > 0
          && newData.val().length <= 140"
      }
    }
  }
}
```


### Check for presence of child attributes

```json
{
  "rules": {
    "posts": {
      "$uid": {
        ".validate": "newData.hasChildren(['username', 'timestamp'])"
      }
    }
  }
}
```


### Validate `timestamp` is not a future value

```json
{
  "rules": {
    "posts": {
      "$uid": {
        "timestamp": { 
          ".validate": "newData.val() <= now" 
        }
      }
    }
  }
}
```


### Prevent updates and deletes

```json
{
  "rules": {
    "posts": {
      "$uid": {
        ".write": "!data.exists()"
      }
    }
  }
}
```

### Prevent deletes, but not updates

```json
{
  "rules": {
    "posts": {
      "$uid": {
        ".write": "newData.exists()"
      }
    }
  }
}
```

### Prevent updates, but not deletes

```json
{
  "rules": {
    "posts": {
      "$uid": {
        ".write": "!data.exists() || !newData.exists()"
      }
    }
  }
}
```

### Prevent creates and deletes

```json
{
  "rules": {
    "posts": {
      "$uid": {
        ".write": "data.exists() && newData.exists()"
      }
    }
  }
}
```

