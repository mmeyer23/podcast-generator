# Podcast Feed Generator


A GitHub action to generate a podcast feed from a YAML file.  YAML is much easier to read and write than XML, and this action will convert your YAML file into a valid podcast feed.

## Usage


### Turn on GitHub Pages

In your repository, go to Settings > Pages and select the main branch as the source.  This will create a link to your page and give all of the content in the main branch a URL.  Note the URL for the next step.

### Create a YAML file

Create a YAML file in your repository with the following format:

```
title: <Podcast Title>
subtitle: <Podcast Subtitle>
author: <Author Name>
description: <Podcast Description>
link: <GitHub Pages URL>
image: <Artwork Location>
language: <Podcast Language e.g. en-us>
category: <Podcast Category e.g. Technology>
format: <Format of files e.g. audio/mpeg>
item:
  -title: <Podcast Episode Title>
   description: <Podcast Episode Description>
   published: <Date Published e.g. Fri, Jan 13 2025 18:00:00 GMT>
   file: <Filename e.g. /audio/TFTT01.mp3>
   duration: <Duration e.g. 00:12:23>
   length: <Length e.g. 546,543>
   ... Repeat for each episode
```

### Sample Workflow

You're also going to need your own workflow file.  Here's a sample:

```
name: Generate Feed
on: [push]
jobs:
  generate-feed:
    runs-on: ubuntu-latest
    steps:
      -name: Checkout Repo
       uses: actions/checkout@v3
      -name: Run Feed Generator
       uses: mmeyer23/podcast-generator@main
```
