notes:
- add simple coverage to track that all lines are covered
- finish all the specs, test business logic, that controllers return :ok
- add raise exceptions when stuff is not saved or it fails
- check nil cases, corner cases, edge cases etc.
- refactor slope_winner method, it works, but it can be smarter just checking the move, sorry no time to re-write it
- move winner logic is using sql, groups, it could even be more performant writing raw sql, vor allem for the slope section
- try to generalize the move is winner method. tried with implementing the equation y=mx +n, you would have two points, and the third one should be align., but no time left
- authorization: in cors, allow only react app to do calls,now it can be done by any
- add pundit, now everyone can edit everything from another player
- presenters are nice, but would be cool to migrate to graphql
- add websockets to avoid refreshing page after every move