name: Build and Publish

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Install
      run: |
        npm ci
    - name: Build
      run: |
        npm run build
    - name: Publish
      run: |
        npm config set //registry.npmjs.org/:_authToken=$NPM_AUTH_TOKEN
        npm run publish || true
      env:
        NPM_AUTH_TOKEN: ${{ secrets.NPM_AUTH_TOKEN }}