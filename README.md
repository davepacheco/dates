# dates: command-line tool for working with timestamps and deltas

## Install

    npm install -g dates-tool


## Synopsis

    dates              # prints current time (in several forms)
    dates TIME         # prints time TIME (in several forms)
    dates T1 T2        # prints T1, T2, and the delta between them
    dates T1 [+-]DELTA # prints T1, DELTA, and T2 = T1 + DELTA

Timestamps can be either integers (which are interpreted as millisecond Unix
epoch times) or a string accepted by JavaScript's `Date.parse()`.  It's
recommended to use ISO 8601 strings for best compatibility.

Deltas can be any integer followed by a suffix "ms", "s", "m", "h", or "d" (for
milliseconds, seconds, minutes, hours, or days).  You can't currently combine
these to do something like "3m4s".


## Examples

Print the current time:

    $ dates
    current time  1518126137.313 s = 2018-02-08T21:42:17.313Z

Print an offset from the current time:

    $ dates +3h
    current time  1518148708.039 s = 2018-02-09T03:58:28.039Z
    delta              10800.000 s = 0d 03h 00m 00.000s
    new time      1518159508.039 s = 2018-02-09T06:58:28.039Z

Format a timestamp, either as a millisecond Unix time or an ISO 8601 time:

    $ dates 2018-02-08
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    $ dates 1518048000000
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    $ dates 2018-02-08T21:01:23.456Z
    given time  1518123683.456 s = 2018-02-08T21:01:23.456Z

You can specify the time zone, too:

    $ dates 2018-02-08T13:43:00-0700
    given time  1518122580.000 s = 2018-02-08T20:43:00.000Z

Subtract two times (i.e., print a delta):

    $ dates 2018-02-08T00:00:00.000Z 2018-02-08T21:01:23.456Z
    time 1      1518048000.000 s = 2018-02-08T00:00:00.000Z
    time 2      1518123683.456 s = 2018-02-08T21:01:23.456Z
    delta            75683.456 s = 0d 21h 01m 23.456s

    $ dates 1518040000000 2018-02-08T00:00:00.000Z
    time 1      1518040000.000 s = 2018-02-07T21:46:40.000Z
    time 2      1518048000.000 s = 2018-02-08T00:00:00.000Z
    delta             8000.000 s = 0d 02h 13m 20.000s

Add a delta to a timestamp:

    $ dates 2018-02-08T00:00:00.000Z +30ms
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    delta                0.030 s = 0d 00h 00m 00.030s
    new time    1518048000.030 s = 2018-02-08T00:00:00.030Z

    $ dates 2018-02-08T00:00:00.000Z +12s
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    delta               12.000 s = 0d 00h 00m 12.000s
    new time    1518048012.000 s = 2018-02-08T00:00:12.000Z

    $ dates 2018-02-08T00:00:00.000Z +123s
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    delta              123.000 s = 0d 00h 02m 03.000s
    new time    1518048123.000 s = 2018-02-08T00:02:03.000Z

    $ dates 2018-02-08T00:00:00.000Z +45m
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    delta             2700.000 s = 0d 00h 45m 00.000s
    new time    1518050700.000 s = 2018-02-08T00:45:00.000Z

    $ dates 2018-02-08T00:00:00.000Z +3h
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    delta            10800.000 s = 0d 03h 00m 00.000s
    new time    1518058800.000 s = 2018-02-08T03:00:00.000Z

    $ dates 2018-02-08T00:00:00.000Z +7d
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    delta           604800.000 s = 7d 00h 00m 00.000s
    new time    1518652800.000 s = 2018-02-15T00:00:00.000Z

    $ dates 2018-02-08T00:00:00.000Z -7d
    given time  1518048000.000 s = 2018-02-08T00:00:00.000Z
    delta          -604800.000 s = -7d 00h 00m 00.000s
    new time    1517443200.000 s = 2018-02-01T00:00:00.000Z


## TODO

See bin/dates.
