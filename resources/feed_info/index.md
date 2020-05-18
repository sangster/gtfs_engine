---
title: FeedInfo
layout: default
cite_google: true
toc: removeTopLevel
----

# FeedInfo

> Additional information about the feed itself, including publisher,
> version, and expiration information.

The file contains information about the feed itself, rather than the services
that the feed describes. GTFS currently has an [agency.txt](agency) file to
provide information about the agencies that operate the services described by
the feed. However, the publisher of the feed is sometimes a different entity
than any of the agencies (in the case of regional aggregators). In addition,
there are some fields that are really feed-wide settings, rather than
agency-wide.

## Fields

### feed_publisher_name `(required)`

The **feed_publisher_name** field contains the full name of the organization
that publishes the feed. (This may be the same as one of the **agency_name**
values in [agency.txt](agency.)) GTFS-consuming applications can display this
name when giving attribution for a particular feed's data.

### feed_publisher_url `(required)`

The **feed_publisher_url** field contains the URL of the feed publishing
organization's website. (This may be the same as one of the **agency_url**
values in [agency.txt](agency.)) The value must be a fully qualified URL that
includes `http://` or `https://`, and any special characters in the URL must be
correctly escaped. See [W3C.org: URIRecommentations](uris) for a description of
how to create fully qualified URL values.

### feed_lang `(required)`

The **feed_lang** field contains a IETF BCP 47 language code specifying the
default language used for the text in this feed. This setting helps GTFS
consumers choose capitalization rules and other language-specific settings for
the feed. For an introduction to IETF BCP 47, please refer to
http://www.rfc-editor.org/rfc/bcp/bcp47.txt and
http://www.w3.org/International/articles/language-tags/.

### feed_start_date

The feed provides complete and reliable schedule information for service in the
period from the beginning of the **feed_start_date** day to the end of the
**feed_end_date** day. Both days are given as dates in YYYYMMDD format as for
[calendar.txt](calendar), or left empty if unavailable. The **feed_end_date**
date must not precede the **feed_start_date** date if both are given. Feed
providers are encouraged to give schedule data outside this period to advise of
likely future service, but feed consumers should treat it mindful of its
non-authoritative status. If **feed_start_date** or **feed_end_date** extend
beyond the active calendar dates defined in [calendar.txt](calendar) and
[calendar_dates.txt](calendar_date), the feed is making an explicit assertion
that there is no service for dates within the **feed_start_date** or
**feed_end_date** range but not included in the active calendar dates.

### feed_end_date

### feed_version

The feed publisher can specify a string here that indicates the current version
of their GTFS feed. GTFS-consuming applications can display this value to help
feed publishers determine whether the latest version of their feed has been
incorporated.

[agency]:        {{ site.url }}/resources/agency
[calendar]:      {{ site.url }}/resources/calendar
[calendar_date]: {{ site.url }}/resources/calendar_date
[uris]:          {{ site.data.urls.w3_uri }}
