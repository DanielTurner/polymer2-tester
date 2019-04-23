#!/bin/bash

bower install

Xvfb :0 -ac +extension RANDR -screen 0 1280x800x24 &
exec "$@"

