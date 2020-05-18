---
title: Calendar
layout: default
cite_google: true
toc: removeTopLevel
---

# Calendar `(required)`

> Dates for service IDs using a weekly schedule. Specify when service starts and
> ends, as well as days of the week where service is available.

## Fields

### service_id `(required)`

The **service_id** contains an ID that uniquely identifies a set of dates when
service is available for one or more routes. Each **service_id** value can
appear at most once in a calendar.txt file. This value is dataset unique. It is
referenced by the trips.txt file.

### _Days of the Week..._ `(required)`

Fields (all are required):

 - **monday**
 - **tuesday**
 - **wednesday**
 - **thursday**
 - **friday**
 - **saturday**
 - **sunday**

Each field contains a binary value that indicates whether the service is valid
for all days of that week.

 - **1**: Indicates that service is available on this day of the week for the
          entire date range. (The date range is specified using the
          **start_date** and **end_date** fields.)

 - **0**: Indicates that service is not available on this day for the entire
          date range.

### start_date `(required)`

The **start_date** field contains the start date for the service.

The **start_date** field's value should be in `YYYYMMDD` format.

### end_date `(required)`

The **end_date** field contains the end date for the service. This date
is included in the service interval.

The **end_date** field's value should be in `YYYYMMDD` format.
