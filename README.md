# Overview

We would like you to create a small app that allows users to browse and play a collection of featured reclip videos.

You have one week to finish this project. The time you'll need to spend at a keyboard is approximately 1 hour.

# Instructions

## Step 1: Clone the starter project

_Estimated working time: 5 min_

Clone this repo. It contains a starter project that you can build upon.

A few notes:
- You'll be fetching data from the "featured feed" API. The starter project includes all of the info needed to use this endpoint.
- The starter project is SwiftUI-based but feel free to use UIKit.
- You are more than welcome to modify the provided components.

## Step 2: Make your changes

_Estimated working time: 1 hour_

Update the starter project to meet the following requirements:
- The app should fetch the latest videos from the "featured feed" API on every launch.
- The "featured feed" API might return duplicates of the same video. The app should filter out these duplicates.
- The user should be able to watch any video from the feed in a full-screen playback view. 
- The full-screen playback view should display info about the playing video, and should match the design specified [here](https://www.figma.com/file/qa80b092KKh1C5Zk7m3jaw/Interview-Project?node-id=2%3A20).
- Tapping the visible video should toggle playback.
- The project should include at least one passing unit test. You pick what to test.

# Grading Criteria (from Highest to Lowest Priority)

- Does the application do what it is supposed to do? In other words, does it satisfy the list of requirements?
- Does the implemented interface match the designs?
- Is the application bug-free?
  - Is it free from memory leaks?
  - Is it free from potential crashes?
  - Is the UI always responsive?
  - Is thread-safety considered?
- Is the application free from compilation warnings?
- Is the code clean?
  - Is the code separated into logical parts?
  - Is the style consistent?
  - Do names make sense?
  - Is the code maintainable and easy to read?
  - Has unused code been deleted?
