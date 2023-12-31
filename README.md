
## Description
Nanonets provides an OCR service where we can create models, train them and use them for OCR predictions. This package is developed to make usage of Nanonets OCR api directly without having to write manual code for integrating it in your application.

***Follow this blog for step by step integration of Nanonets OCR model in a Flutter application:*** ***[Implementing Nanonets OCR in Flutter](https://medium.com/@jigyasa14ch99/implementing-nanonets-ocr-in-flutter-613881dde173)***

- flutter_nanonets_ocr: [flutter_nanonets_ocr](https://pub.dev/packages/flutter_nanonets_ocr)

  [![Pub](https://img.shields.io/pub/v/flutter_nanonets_ocr.svg?label=dev&include_prereleases)](https://pub.dev/packages/flutter_nanonets_ocr)


## Get started
Add dependency 
You can use the command to add flutter_nanonets_ocr as a dependency with the latest stable version:

``` 
   $ dart pub add flutter_nanonets_ocr

```

Or you can manually add flutter_nanonets_ocr into the dependencies section in your pubspec.yaml:


```
  dependencies:
      flutter_nanonets_ocr: ^0.0.12

```

## Example

### Fetching details using document file

```
 import 'package:flutter_nanonets_ocr/flutter_nanonets_ocr.dart';
  
 String apiKey = "INSERT NANONETS API KEY";

 NanonetsOCR nanonetsOCR = NanonetsOCR();

 FutureBuilder(
            future: nanonetsOCR.predictDocumentFile(apiKey, docImage,
                    "INSERT OCR MODEL ID HERE", context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                return loadingWidget();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return yourSuccessWidget();
              } else {
                return loadingWidget();
              }
            });


```

### Fetching details using document url


```
 import 'package:flutter_nanonets_ocr/flutter_nanonets_ocr.dart';
  
 String apiKey = "INSERT NANONETS API KEY";

 NanonetsOCR nanonetsOCR = NanonetsOCR();

 FutureBuilder(
            future: nanonetsOCR.predictDocumentURL(apiKey, docImageUrl,
                    "INSERT OCR MODEL ID HERE", context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                return loadingWidget();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return yourSuccessWidget();
              } else {
                return loadingWidget();
              }
            });


```

