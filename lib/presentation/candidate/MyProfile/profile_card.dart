import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_sizes.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  Uint8List? _imageData; // Variable to store the selected image data

  // Method to handle image selection from gallery
  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      setState(() {
        _imageData = imageBytes; // Store the selected image data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: _selectImage,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue, // Border color
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: _imageData == null
                      ? const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                color: textSecondary,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Upload your profile photo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: textSecondary,
                                ),
                              ),
                            ],
                          ),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage: MemoryImage(
                              _imageData!), // Display selected image
                        ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Ratan Deo",
                style: TextStyle(
                  fontSize: fontSizeMd,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Last updated: 3 months ago",
                style: TextStyle(
                  fontSize: 12,
                  color: textSecondary,
                ),
              ),
              const SizedBox(height: 8),
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
                    "Edit Profile",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: fontSizeSm,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 30),
              const Divider(color: textTertiary),
              _listTile(Icons.location_on_outlined, "Pune, India"),
              _listTile(CupertinoIcons.phone, "+91 9822496890"),
              _listTile(Icons.email_outlined, "deo.ratan29@gmail.com"),
              const Divider(color: textTertiary),
              // briefcase
              _listTile(CupertinoIcons.briefcase, "2 Years"),
              _listTile(Icons.wallet, "Rs. 4,80,000"),
              _listTile(CupertinoIcons.creditcard, "Rs. 12.00.000"),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // color: primaryColor,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff30EBFF),
                Color(0xff21A0FF),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Wallet",
                    style: TextStyle(
                      fontSize: fontSizeLg,
                      color: whiteColor,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.creditcard,
                    color: whiteColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(
                  text: 'Rs. ',
                  style: TextStyle(
                    fontSize: fontSizeExtraLg,
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  children: [
                    TextSpan(
                      text: 'xx,xxxx/-',
                      style: TextStyle(
                        fontSize: fontSizeLg,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Credited 4 months ago",
                style: TextStyle(
                  color: whiteColor.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: textSecondary,
            size: 20,
          ),
          const SizedBox(width: 7),
          Text(
            title,
            style: const TextStyle(
              color: textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
