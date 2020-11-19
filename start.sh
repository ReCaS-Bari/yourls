#!/bin/bash

envsubst < /etc/apache2/sites-available/https_yourls.conf > /etc/apache2/sites-enabled/https_yourls.conf
apache2-foreground


