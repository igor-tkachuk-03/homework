#!/bin/bash
docker build -t url-shortener .
docker run -p 5000:5000 url-shortener
