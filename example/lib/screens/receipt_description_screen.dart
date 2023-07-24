// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_nanonets_ocr/flutter_nanonets_ocr.dart';
import 'package:flutter_nanonets_ocr/models/ocr_predictor_response_model.dart';

import '../constants/color_constants.dart';
import '../constants/strings_constants.dart';

class ReceiptPredictionScreen extends StatefulWidget {
  final File? image;
  final String? documentUrl;
  bool isUrl;

  ReceiptPredictionScreen(
      {this.image, this.documentUrl, required this.isUrl, super.key});

  @override
  State<ReceiptPredictionScreen> createState() =>
      _ReceiptPredictionScreenState();
}

class _ReceiptPredictionScreenState extends State<ReceiptPredictionScreen> {
  String apiKey = "YOUR NANONETS API KEY HERE";
  @override
  Widget build(BuildContext context) {
    NanonetsOCR nanonetsOCR = NanonetsOCR();
    return Scaffold(
        appBar: AppBar(
          title: Text(homeOCRPredictor),
        ),
        body: FutureBuilder(
            future: widget.isUrl
                ? nanonetsOCR.predictDocumentURL(apiKey, widget.documentUrl,
                    "YOUR OCR MODEL ID HERE", context)
                : nanonetsOCR.predictDocumentFile(
                    apiKey, widget.image, "YOUR OCR MODEL ID HERE", context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                return loadingWidget();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                    child: predictedDataSection(context, snapshot));
              } else {
                return loadingWidget();
              }
            }));
  }

  Widget loadingWidget() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: widget.image == null && widget.isUrl
                  ? Image.network(widget.documentUrl ?? "")
                  : Image.file(
                      widget.image!,
                      fit: BoxFit.fitHeight,
                    ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(color: Colors.purple.withOpacity(0.2)),
            child: Center(child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }

  Widget predictedDataSection(
      BuildContext context, AsyncSnapshot<OcrPredictorResponseModel> snapshot) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Document's Details",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: snapshot.data!.result.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Can't fetch data. Please check model id or uploaded image and try again.",
                      style: TextStyle(
                          color: kRed,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.result[0].prediction.length,
                    itemBuilder: (context, index) {
                      return snapshot.data!.result[0].prediction[index].label ==
                              "table"
                          ? Container()
                          : Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              color: kGreen,
                              child: Text(
                                "${snapshot.data!.result[0].prediction[index].label.toString()} : ${snapshot.data!.result[0].prediction[index].ocrText.toString()}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ));
                    }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: widget.image == null && widget.isUrl
                  ? Image.network(widget.documentUrl ?? "")
                  : Image.file(
                      widget.image!,
                      fit: BoxFit.fitHeight,
                    ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
