#!/bin/bash
/opt/stardog/bin/stardog-admin server start && sleep 1 && /opt/stardog/bin/stardog-admin db create -n test data.ttl
#/opt/stardog/bin/stardog-admin db create -n test data.ttl
