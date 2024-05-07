import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

import '../../../utils/constants/const_colors.dart';

class MyResumeCard extends StatefulWidget {
  const MyResumeCard({super.key});

  @override
  State<MyResumeCard> createState() => _MyResumeCardState();
}

class _MyResumeCardState extends State<MyResumeCard> {
  PlatformFile? _selectedFile;
  void _uploadResume(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        if (file.extension == 'pdf') {
          setState(() {
            _selectedFile = file;
          });
        } else if (file.extension == 'docx') {
          // Read DOCX file content
          // Implement DOCX parsing logic using a suitable package (e.g., 'docx')
        }
      } else {
        // User canceled file picking
        print('File picking canceled.');
      }
    } catch (e) {
      print('Error picking file: $e');
      // Handle error (e.g., show error message)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error picking file. Please try again.'),
        ),
      );
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFile = null;
    });
  }

  String _formatDate(DateTime date) {
    // Extract day, month, and year
    final day = date.day;
    final month = date.month;
    final year = date.year;

    // Create ordinal suffix for the day
    String daySuffix = 'th';
    if (day == 1 || day == 21 || day == 31) {
      daySuffix = 'st';
    } else if (day == 2 || day == 22) {
      daySuffix = 'nd';
    } else if (day == 3 || day == 23) {
      daySuffix = 'rd';
    }

    // Define month names
    final months = [
      '', // 0th index is unused for month names
      'January', 'February', 'March', 'April', 'May', 'June', 'July',
      'August', 'September', 'October', 'November', 'December'
    ];

    // Format the date as "15th May 2023" using the custom format
    return '$day$daySuffix ${months[month]} $year';
  }

  Future<void> _downloadFile() async {
    if (_selectedFile == null) return;

    final Uint8List fileBytes = _selectedFile!.bytes!; // Get file bytes
    final String fileName = _selectedFile!.name; // Get file name

    // Convert bytes to Blob
    final blob = html.Blob([fileBytes]);

    // Create object URL from Blob
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create an anchor element
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName) // Set download attribute
      ..click(); // Simulate click to trigger download

    // Revoke the object URL to free up resources
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Resume",
            style: TextStyle(
              color: textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeLg,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: textTertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_selectedFile != null)
                      Text(
                        'Selected File: ${_selectedFile!.name}',
                        style: const TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeSm,
                        ),
                      ),
                    const SizedBox(height: 5),
                    Text(
                      "Uploaded on ${_formatDate(DateTime.now())}",
                      style: const TextStyle(
                        color: textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: _downloadFile,
                      icon: const Icon(
                        Icons.file_download_outlined,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        _removeFile();
                      },
                      icon: const Icon(
                        CupertinoIcons.delete,
                        size: 18,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          DottedBorder(
            borderType: BorderType.Rect,
            strokeWidth: 1,
            color: textSecondary,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: textSecondary,
                // ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "Upload Resume",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: fontSizeSm,
                        ),
                      ),
                      onPressed: () {
                        _uploadResume(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    "Supported formats: pdf, doc, docx, rtf",
                    style: TextStyle(
                      color: textSecondary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
