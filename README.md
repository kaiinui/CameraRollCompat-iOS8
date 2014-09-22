iOS8CameraRollCompat
====================

Working with Camera Roll in iOS8. Where Camera Roll is thrown away by Apple in iOS8.

Background
---

In iOS8, there's no Camera Roll in Photo Library.
So most of App which uses Camera Roll is broken. It shows only photos which added after the user them device updated to iOS8.

How?
---

Hijack `- enumerateGroupsUsingBlock` and `- enumerateAssetsUsingBlock`.

And there're problem more, `asset.URL` is not working. So it will map it into `localIdentifier`. And hijacks `- assetWithAssetURL`, when an URL is passed simply use it and when a localIdentifier is passed, use `assetForLocalIdentifier` instead.
