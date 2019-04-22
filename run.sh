#!/bin/bash

set -m
nohup ./usr/local/FrontBase/bin/FBExec &

sleep 5
/usr/local/FrontBase/bin/sql92 db.sql

fg %1
