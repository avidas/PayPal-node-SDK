#!/bin/sh

mkdir ../gh-pages
mkdir ../gh-pages/

# Generate Doc
grunt jsdoc

# Copy Home Page from Master Branch to Gh-Pages folder
cp -r docs/* ../gh-pages/

cd ../gh-pages

# Set identity
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis"

# Add branch
git init
git remote add origin https://${GH_TOKEN}@github.com/avidas/PayPal-Node-SDK.git > /dev/null
git checkout -B gh-pages

# Push generated files
git add .
git commit -m "API updated"
git push origin gh-pages -fq > /dev/null