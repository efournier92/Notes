# Firebase 

## Overview

## Realtime Database

### Description
Below are a variety of rules, for use with [Firebase](https://firebase.google.com) [Realtime Database](https://firebase.google.com/docs/database).

### Rules

#### No security
```json
{
  "rules": {
    ".read": true,
    ".write": true
  }
}
```

#### Full security
```json
{
  "rules": {
    ".read": false,
    ".write": false
  }
}
```

#### Only authenticated users can access/write data
```json
{
  "rules": {
    ".read": "auth != null",
    ".write": "auth != null"
  }
}
```

#### User can only access their own data
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

#### Validate user is moderator, from different DB location
```json
{
  "rules": {
    "posts": {
      "$uid": {
        ".write": "root.child('users').child('moderator').val() === true"
      }
    }
  }
}
```


#### Validate `string` datatype and `length` range
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


#### Check for presence of child attributes
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


#### Validate `timestamp` is not a future value
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


#### Prevent updates and deletes
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

#### Prevent deletes, but not updates
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

#### Prevent updates, but not deletes
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

#### Prevent creates and deletes
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

