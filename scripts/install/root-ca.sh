#!/bin/bash

# Installing root certificate authority
if [ -e "$DATA_DIRECTORY/ssh" ]; then

    echo "checking for certificate authority file 'ca.cert'..."



    if [ -e "$DATA_DIRECTORY/certs/ca-authority.cert" ]; then
        cp $DATA_DIRECTORY/certs/ca-authority.cert /etc/ssl/certs/custom-ca-authority.cert
        chmod 600 $DATA_DIRECTORY/ssh/id_rsa
        ln -s $DATA_DIRECTORY/ssh/id_rsa /var/www/.ssh/id_rsa

    fi

    if [ -e "$DATA_DIRECTORY/ssh/id_rsa.pub" ]; then
        chmod 644 $DATA_DIRECTORY/ssh/id_rsa.pub
        ln -s $DATA_DIRECTORY/ssh/id_rsa.pub /var/www/.ssh/id_rsa.pub
    fi

    if [ -e "$DATA_DIRECTORY/ssh/known_hosts" ]; then
        chmod 644 $DATA_DIRECTORY/ssh/known_hosts
        ln -s $DATA_DIRECTORY/ssh/known_hosts /var/www/.ssh/known_hosts
    fi

    if [ -e "$DATA_DIRECTORY/ssh/config" ]; then
        chmod 644 $DATA_DIRECTORY/ssh/config
        ln -s $DATA_DIRECTORY/ssh/config /var/www/.ssh/config
    fi

    chmod 700 $DATA_DIRECTORY/ssh
    chown -R www-data:www-data $DATA_DIRECTORY/ssh

fi