```
Retrieve
    - ✅ empty cache works (before something is inserted)
    - ✅ empty cache twice return sampe empty cache (no side-effects)
    - ✅ non-empty cache return data
    - ✅ non-empty cache twice return same data (retrieve shoul d have no side-effects)
    - ✅ Error return error (if possible to simulate e.g., invalid data)
    - ✅ Error twice return same error (if possible to simulate e.g., invalid data)
    
Insert
    - ✅ to empty cache works
    - ✅ to non-empty cache overrides previous value
    - Error (if possible e.g., no write permission)

Delete
    - empty cache does nothing (cache stays empty and does not fail)
    - inserted data leaves cache empty
    - Error (if possible to simulate e.g., no write permission)
    
Side-effects must run serially to avoid race-conditions (deleting the wrong cache... overriding the latest data...)
```
