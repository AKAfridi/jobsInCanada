import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

// ignore: must_be_immutable
class Cv extends StatefulWidget {
  Cv({super.key, required this.title});
  String title;

  @override
  State<Cv> createState() => _CvState();
}

class _CvState extends State<Cv> {
  File? file;
  Future<File?> pickFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result == null) return null;
    return File(result.paths.first!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff4f0000)),
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 5),
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff4f0000)),
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 5),
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff4f0000)),
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 5),
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Phone No... (Optional)',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                child: ListTile(
                  onTap: () async {
                    file = await pickFile();
                    setState(() {});
                  },
                  contentPadding: const EdgeInsets.all(7),
                  title: const Text("Upload CV"),
                  leading: Image.asset(
                    "assets/icons/cv_2.png",
                    height: 50,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ignore: unnecessary_null_comparison
              file == null
                  ? const SizedBox()
                  : SizedBox(
                      width: double.infinity,
                      height: 600,
                      child: PDFView(
                        filePath: file!.path,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
