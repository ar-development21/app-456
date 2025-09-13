import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/ai/providers/chat_provider.dart';
import '../models/chat_message.dart';
import 'package:provider/provider.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final int index;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return message.when(
      user: (msg, imagePath) => Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF4F46E5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            msg,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ),
      ),
      ai: (msg, isThinking, liked, disliked) => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msg,
                style: GoogleFonts.poppins(color: Colors.black87),
              ),
              const SizedBox(height: 4),
              if (!isThinking)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: liked ? Colors.green : Colors.grey,
                        size: 18,
                      ),
                      onPressed: () =>
                          context.read<ChatProvider>().toggleLike(index),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.thumb_down,
                        color: disliked ? Colors.red : Colors.grey,
                        size: 18,
                      ),
                      onPressed: () =>
                          context.read<ChatProvider>().toggleDislike(index),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
