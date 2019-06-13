# Firebase Realtime Database Rules

## No Security
```json
{
  "rules": {
    ".read": true,
    ".write": true
  }
}
```

## Full security
```json
{
  "rules": {
    ".read": false,
    ".write": false
  }
}
```

## Only authenticated users can access/write data
```json
{
  "rules": {
    ".read": "auth != null",
    ".write": "auth != null"
  }
}
```

## User can only access their own data
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


## Validates user is moderator from different database location
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


## Validates string datatype and length range
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


## Checks presense of child attributes
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


## Validates timestamp is not a future value
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


## Prevents Delete or Update
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

## Prevents only Delete
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

## Prevents only Update
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

## Prevents Create and Delete
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

