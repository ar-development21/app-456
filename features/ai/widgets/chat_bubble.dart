import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/ai/models/chat_message.dart';
import 'package:notesmedia/features/ai/providers/ai_provider.dart';
import 'package:notesmedia/features/ai/widgets/thinking_dots.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage chat;
  final int index;
  final AiProvider provider;
  final bool useMarkdown;

  const ChatBubble({
    super.key,
    required this.chat,
    required this.index,
    required this.provider,
    this.useMarkdown = true,
  });

  Widget _renderMessage(String text, BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    final textColor = isDarkMode
        ? Colors.white.withOpacity(0.87)
        : Colors.black87;

    if (useMarkdown) {
      return MarkdownBody(
        data: text,
        selectable: true,
        styleSheet: MarkdownStyleSheet(
          p: GoogleFonts.poppins(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// feedback popup for dislike
  Future<String?> _showFeedbackDialog(BuildContext context) async {
    final controller = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Provide Feedback"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Why did you dislike this response?",
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: const Text("Cancel"),
          ),

          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, controller.text.trim());
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUser = chat is UserChatMessage;
    final aiBubbleColor = theme.cardColor;
    final userBubbleColor = TColors.primary;
    final shadowColor = theme.shadowColor.withOpacity(0.3);

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isUser
              ? userBubbleColor
              : useMarkdown
              ? aiBubbleColor
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(16).copyWith(
            topLeft: isUser
                ? const Radius.circular(16)
                : const Radius.circular(4),
            topRight: isUser
                ? const Radius.circular(4)
                : const Radius.circular(16),
          ),
          boxShadow: useMarkdown
              ? [
                  BoxShadow(
                    color: shadowColor,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: chat.when(
          user: (message, imagePath) => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (imagePath != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(imagePath),
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Text(
                message,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          ai: (message, isThinking, liked, disliked) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isThinking)
                useMarkdown
                    ? const ThinkingDots()
                    : LinearProgressIndicator(color: TColors.primary)
              else
                _renderMessage(message, context),
              if (!isThinking)
                /// Only changes in Like/Dislike buttons section
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Like Button
                      IconButton(
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          liked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                          size: 16,
                          color: liked ? Colors.blue : Colors.grey[600],
                        ),
                        onPressed: (liked || disliked)
                            /// Disable if already action taken
                            ? null
                            : () => provider.toggleLike(index),
                      ),

                      /// Dislike Button with Feedback
                      IconButton(
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          disliked
                              ? Icons.thumb_down
                              : Icons.thumb_down_alt_outlined,
                          size: 16,
                          color: disliked ? Colors.red : Colors.grey[600],
                        ),
                        onPressed: (liked || disliked)
                            ? null
                            : () async {
                                final feedback = await _showFeedbackDialog(
                                  context,
                                );
                                if (feedback != null &&
                                    feedback.trim().isNotEmpty) {
                                  provider.toggleDislike(
                                    index,
                                    feedbackText: feedback,
                                  );
                                }
                                // ❌ else me kuch mat likho
                              },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
