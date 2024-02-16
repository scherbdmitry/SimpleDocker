#!/bin/bash

gcc -o mini_server mini_server.c -lfcgi
service nginx start
spawn-fcgi -p 8080 mini_server
