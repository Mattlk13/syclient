#!/bin/bash
#../conf/master.properties
sqlite3 /tmp/client.db  < initial.sql
sqlite3 /tmp/client.db  .tables
