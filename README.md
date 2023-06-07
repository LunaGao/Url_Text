# url_text

Url Test. Identify web links in text and make them clickable.

## What is looks like?
![Screenshot](./github/image.png)

## Getting Started

```dart
UrlText(
    'This https://www.google.com is jump to Google.',
    urlStyle: TextStyle(
        color: Colors.purple,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w800),
    style: TextStyle(color: Colors.pink),
    markdown: false,
),
UrlText(
    'Or just using the markdown. [This is Google Web](https://www.google.com).',
    urlStyle: TextStyle(
        color: Colors.purple,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w800),
    style: TextStyle(color: Colors.pink),
    markdown: true,
),
```

## Publish to Pub.dev
```
flutter format .
flutter pub publish --dry-run
flutter pub publish
```