#!/bin/sh

export $(cat secret.env | xargs)

