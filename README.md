# Essential Feed App (Course Exercise from essentialdeveloper.com)

[![Build Status](https://travis-ci.com/arifinfrds/iOS-EssentialFeed.svg?branch=master)](https://travis-ci.com/arifinfrds/iOS-EssentialFeed)

## Image Feed Feature Specs

### Story: Customer requests to see their image feed

### Narrative #1

```
As an online customer
I want the app to automatically load my latest image feed
So I can always enjoy the newest images of my friends
```

#### Scenarios (Acceptance criteria)

```
Given the customer has connectivity
 When the customer requests to see their feed
 Then the app should display the latest feed from remote
  And replace the cache with the new feed
```
