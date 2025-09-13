import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notesmedia/features/ai/providers/ai_provider.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final AiProvider provider;

  const ChatInput({
    super.key,
    required this.controller,
    required this.provider,
  });

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_camera, color: Color(0xFF4F46E5)),
            title: Text(
              'Camera',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
              provider.pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library, color: Color(0xFF4F46E5)),
            title: Text(
              'Gallery',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
              provider.pickImage(ImageSource.gallery);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (provider.selectedImagePath != null)
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 8, right: 12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(provider.selectedImagePath!),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Image attached',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red, size: 24),
                      onPressed: () => provider.setSelectedImage(null),
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add_a_photo_outlined, color: TColors.primary, size: 24),
                  onPressed: () => _showImagePickerOptions(context),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onSubmitted: (_) {
                      if (controller.text.trim().isNotEmpty) {
                        provider.sendMessage(controller.text);
                        controller.clear();
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: TColors.primary, size: 24),
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      provider.sendMessage(controller.text);
                      controller.clear();
                    }
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}