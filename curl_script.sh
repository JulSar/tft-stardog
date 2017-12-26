#!/bin/bash
netstat -an|grep LISTEN
curl -v -X POST -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "text/plain" "http://127.0.0.1:5820/test/transaction/begin"