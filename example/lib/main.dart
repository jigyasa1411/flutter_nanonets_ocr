// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';
import 'package:example/screens/receipt_description_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'constants/color_constants.dart';
import 'constants/strings_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? pickedImage;
  Future<File?> pickImage(ImageSource imageType) async {
    try {
      final photo =
          await ImagePicker().pickImage(source: imageType, imageQuality: 100);
      if (photo == null) return null;
      File? tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (error) {
      log(error.toString());
    }
    return pickedImage;
  }

  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              homeOCRPredictor,
              style: TextStyle(
                  color: kBlack, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            pickedImage == null
                ? Container()
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        pickedImage!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                try {
                  await pickImage(ImageSource.gallery);
                  if (pickedImage != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReceiptPredictionScreen(
                          image: pickedImage!,
                          isUrl: false,
                        ),
                      ),
                    );
                  }
                } catch (err) {
                  log(err.toString());
                }
              },
              child: Container(
                height: 70,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kWhite,
                    border: Border.all(color: kBlack, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  uploadPassportImage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            /// Predict Document URL
            Container(
                height: 70,
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kWhite,
                    border: Border.all(color: kBlack, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: TextFormField(
                  controller: urlController,
                  style: TextStyle(
                      color: kBlack, fontSize: 16, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(hintText: "Enter Document URL"),
                  onEditingComplete: () {
                    if (urlController.text.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ReceiptPredictionScreen(
                            image: null,
                            documentUrl: urlController.text.trim(),
                            isUrl: true,
                          ),
                        ),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
