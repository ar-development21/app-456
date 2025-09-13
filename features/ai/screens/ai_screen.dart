import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/ai/providers/ai_provider.dart';
import 'package:notesmedia/features/ai/screens/ai_chat_bottom_sheet.dart';
import 'package:notesmedia/features/ai/widgets/chat_bubble.dart';
import 'package:notesmedia/features/ai/widgets/chat_input.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AiProvider(),
      child: const _AIPageView(),
    );
  }
}

class _AIPageView extends StatefulWidget {
  const _AIPageView();

  @override
  State<_AIPageView> createState() => _AIPageViewState();
}

class _AIPageViewState extends State<_AIPageView> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Listen to AiProvider changes to scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AiProvider>(context, listen: false).addListener(_scrollToBottom);
    });
  }

  @override
  void dispose() {
    // Remove listener to prevent memory leaks
    Provider.of<AiProvider>(context, listen: false).removeListener(_scrollToBottom);
    _chatController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  void _showBottomSheet(AiProvider provider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AiChatBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AiProvider>(context);
    final theme = Theme.of(context);
    final isDarkMode = THelperFunctions.isDarkMode(context);
    if (provider.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(provider.errorMessage!)),
        );
        provider.clearChat();
      });
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 🔙 Back button
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isDarkMode
                            ? [const Color(0xFF312E81), const Color(0xFF1E1B4B)]
                            : [const Color(0xFF6366F1), const Color(0xFF4F46E5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: (isDarkMode ? Colors.deepPurple : Colors.indigo)
                              .withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color:  Colors.white ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  // ✨ Center pill-shaped title
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isDarkMode
                            ? [const Color(0xFF312E81), const Color(0xFF1E1B4B)]
                            : [const Color(0xFF6366F1), const Color(0xFF4F46E5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: (isDarkMode ? Colors.deepPurple : Colors.indigo)
                              .withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Text("✨", style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 6),
                        Text(
                          "NotesMedia Ai",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 🚩 Right toggle flag button
                  Consumer<AiProvider>(
                    builder: (context, provider, _) {
                      final bool isActive = provider.saveHistory;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          // ✅ Gradient only if active
                          gradient: isActive
                              ? LinearGradient(
                            colors: isDarkMode
                                ? [const Color(0xFF312E81), const Color(0xFF1E1B4B)]
                                : [const Color(0xFF6366F1), const Color(0xFF4F46E5)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                              : null,
                          // ✅ Grey color if inactive
                          color: isActive
                              ? null
                              : (isDarkMode
                              ? Colors.grey.shade700
                              : Colors.grey.shade400),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: isActive
                                  ? (isDarkMode
                                  ? Colors.deepPurple.withOpacity(0.4)
                                  : Colors.indigo.withOpacity(0.4))
                                  : Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(
                            isActive ? Icons.flag : Icons.flag_outlined,
                            color: Colors.white,
                          ),
                          onPressed: provider.toggleSaveHistory,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),


      body: Column(
        children: [
          Expanded(
            child: provider.chatHistory.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline, size: 40, color: Colors.grey[600]),
                  const SizedBox(height: 16),
                  Text(
                    "Start chatting with your Study Buddy",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
                : ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: provider.chatHistory.length,
              itemBuilder: (context, index) => ChatBubble(
                chat: provider.chatHistory[index],
                index: index,
                provider: provider,
                useMarkdown: true,
              ),
            ),
          ),
          ChatInput(
            controller: _chatController,
            provider: provider,
          ),
        ],
      ),
    );
  }
}