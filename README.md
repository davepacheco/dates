# dates: command-line tool for working with timestamps and deltas

## Install

    npm install -g dates-tool


## Synopsis

    dates              # prints current time (in several forms)
    dates TIME         # prints time TIME (in several forms)
    dates [+-]DELTA    # prints current time offset by DELTA
    dates T1 T2        # prints T1, T2, and the delta between them
    dates T1 [+-]DELTA # prints T1, DELTA, and T2 = T1 + DELTA

Timestamps can be either integers (which are interpreted as millisecond Unix
epoch times) or a string accepted by JavaScript's `Date.parse()`.  It's
recommended to use ISO 8601 strings for best compatibility.

Deltas can be any integer followed by a suffix "ms", "s", "m", "h", or "d" (for
milliseconds, seconds, minutes, hours, or days).  You can't currently combine
these to do something like "3m4s".

For output, times are printed in the local time zone as well as UTC.


## Examples

Print the current time:

    $ dates
    now     1518150458.464 s = 2018-02-08T20:27:38.464-08:00
                             = 2018-02-09T04:27:38.464Z

Print an offset from the current time:

    $ dates +3h
    time 1  1518150462.327 s = 2018-02-08T20:27:42.327-08:00
                             = 2018-02-09T04:27:42.327Z
    delta        10800.000 s = 0d 03h 00m 00.000s
    time 2  1518161262.327 s = 2018-02-08T23:27:42.327-08:00
                             = 2018-02-09T07:27:42.327Z

Format a timestamp, either as a millisecond Unix time or an ISO 8601 time:

    $ dates 2018-02-08
    time    1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    $ dates 1518048000000
    time    1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    $ dates 2018-02-08T21:01:23.456Z
    time    1518123683.456 s = 2018-02-08T13:01:23.456-08:00
                             = 2018-02-08T21:01:23.456Z

You can specify the time zone, too:

    $ dates 2018-02-08T13:43:00-0700
    time    1518122580.000 s = 2018-02-08T12:43:00.000-08:00
                             = 2018-02-08T20:43:00.000Z

Subtract two times (i.e., print a delta):

    $ dates 2018-02-08T00:00:00.000Z 2018-02-08T21:01:23.456Z
    time 1  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    time 2  1518123683.456 s = 2018-02-08T13:01:23.456-08:00
                             = 2018-02-08T21:01:23.456Z
    delta        75683.456 s = 0d 21h 01m 23.456s

    $ dates 1518040000000 2018-02-08T00:00:00.000Z
    time 1  1518040000.000 s = 2018-02-07T13:46:40.000-08:00
                             = 2018-02-07T21:46:40.000Z
    time 2  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    delta         8000.000 s = 0d 02h 13m 20.000s

Add a delta to a timestamp:

    $ dates 2018-02-08T00:00:00.000Z +30ms
    time 1  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    delta            0.030 s = 0d 00h 00m 00.030s
    time 2  1518048000.030 s = 2018-02-07T16:00:00.030-08:00
                             = 2018-02-08T00:00:00.030Z

    $ dates 2018-02-08T00:00:00.000Z +12s
    time 1  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    delta           12.000 s = 0d 00h 00m 12.000s
    time 2  1518048012.000 s = 2018-02-07T16:00:12.000-08:00
                             = 2018-02-08T00:00:12.000Z

    $ dates 2018-02-08T00:00:00.000Z +123s
    time 1  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    delta          123.000 s = 0d 00h 02m 03.000s
    time 2  1518048123.000 s = 2018-02-07T16:02:03.000-08:00
                             = 2018-02-08T00:02:03.000Z

    $ dates 2018-02-08T00:00:00.000Z +45m
    time 1  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    delta         2700.000 s = 0d 00h 45m 00.000s
    time 2  1518050700.000 s = 2018-02-07T16:45:00.000-08:00
                             = 2018-02-08T00:45:00.000Z

    $ dates 2018-02-08T00:00:00.000Z +3h
    time 1  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    delta        10800.000 s = 0d 03h 00m 00.000s
    time 2  1518058800.000 s = 2018-02-07T19:00:00.000-08:00
                             = 2018-02-08T03:00:00.000Z

    $ dates 2018-02-08T00:00:00.000Z +7d
    time 1  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    delta       604800.000 s = 7d 00h 00m 00.000s
    time 2  1518652800.000 s = 2018-02-14T16:00:00.000-08:00
                             = 2018-02-15T00:00:00.000Z

    $ dates 2018-02-08T00:00:00.000Z -7d
    time 1  1518048000.000 s = 2018-02-07T16:00:00.000-08:00
                             = 2018-02-08T00:00:00.000Z
    delta      -604800.000 s = -7d 00h 00m 00.000s
    time 2  1517443200.000 s = 2018-01-31T16:00:00.000-08:00
                             = 2018-02-01T00:00:00.000Z


## TODO

See bin/dates.
