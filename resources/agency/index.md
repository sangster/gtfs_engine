---
title: Agency
layout: default
cite_google: true
toc: removeTopLevel
---

# Agency `(required)`

> One or more transit agencies that provide the data in this feed.

It's important to remember that although the `agency_id` field is marked as
"required", it may be blank or missing in the event that there is only one
entry.

## Routes

#### Get All Agencies

```
GET /agencies
```

#### Get a Single Agency

```
GET /agencies/:agency_id
```

### Example Response

``` json
{
  "status": "success",
  "data": {
    "agency_id": "ag01",
    "agency_name": "Example Transit",
    "agency_url": "http://www.example.com/transit.html",
    "agency_timezone": "America/Halifax",
    "agency_lang": "en"
  }
}
```

## Fields

### agency_id `(required)`

The **agency_id** field is an ID that uniquely identifies a transit agency. A
transit feed may represent data from more than one agency. The **agency_id** is
dataset unique.

This field is **optional** for transit feeds that only contain data for a single
agency.

### agency_name `(required)`

The **agency_name** field contains the full name of the transit agency.

### agency_url `(required)`

The **agency_url** field contains the URL of the transit agency. The
value must be a fully qualified URL that includes `http://` or
`https://`, and any special characters in the URL must be correctly
escaped. See [W3.org: URI Recommentations](uri) for a description of how
to create fully qualified URL values.

### agency_timezone `(required)`

The **agency_timezone** field contains the timezone where the transit agency is
located. Timezone names never contain the space character but may contain an
underscore. Please refer to [Wikipedia.org: List of TZ Zones](zones) for a list
of valid values. If multiple agencies are specified in the feed, each must have
the same **agency_timezone**.

#### agency_lang

The **agency_lang** field contains a two-letter ISO 639-1 code for the primary
language used by this transit agency. The language code is case-insensitive
(both en and EN are accepted). This setting defines capitalization rules and
other language-specific settings for all text contained in this transit agency's
feed. Please refer to [Loc.gov: Country Codes](codes) for a list of valid
values.

#### agency_phone

The **agency_phone** field contains a single voice telephone number for the
specified agency. This field is a string value that presents the telephone
number as typical for the agency's service area. It can and should contain
punctuation marks to group the digits of the number. Dialable text (for example,
TriMet's "503-238-RIDE") is permitted, but the field must not contain any other
descriptive text.

#### agency_fare_url

The **agency_fare_url** specifies the URL of a web page that allows a rider to
purchase tickets or other fare instruments for that agency online. The value
must be a fully qualified URL that includes `http://` or `https://`, and any
special characters in the URL must be correctly escaped. See [W3.org: URI
Recommendations](uri) for a description of how to create fully qualified URL
values.

[uri]:   {{ site.data.urls.w3_uri }}
[codes]: {{ site.data.urls.country_codes }}
[zones]: {{ site.data.urls.time_zones }}
