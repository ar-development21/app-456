import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/ai/providers/chat_provider.dart';
import 'package:notesmedia/features/ai/widgets/chat_message_bubble.dart';
import 'package:provider/provider.dart';

class AiChatBottomSheet extends StatefulWidget {
  const AiChatBottomSheet({super.key});

  @override
  State<AiChatBottomSheet> createState() => _AiChatBottomSheetState();
}

class _AiChatBottomSheetState extends State<AiChatBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _handleSend(ChatProvider provider) {
    final query = _controller.text.trim();
    if (query.isNotEmpty && !provider.isThinking) {
      provider.sendMessage(query);
      _controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, provider, _) {
        final messages = provider.messages;

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'AI Insights',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4F46E5),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ChatMessageBubble(
                        message: message,
                        index: index,
                      );
                    },
                  ),
                ),
                if (provider.isThinking)
                  const LinearProgressIndicator(color: Color(0xFF6366F1)),
                _buildInput(provider),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInput(ChatProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        controller: _controller,
        onSubmitted: (_) => _handleSend(provider),
        textInputAction: TextInputAction.send,
        decoration: InputDecoration(
          hintText: 'Ask a question...',
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF4F46E5)),
            onPressed: () => _handleSend(provider),
          ),
        ),
        style: GoogleFonts.poppins(),
      ),
    );
  }
}
