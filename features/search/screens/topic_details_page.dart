import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/search/providers/topic_details_provider.dart';
import 'package:provider/provider.dart';

class TopicDetailsPage extends StatelessWidget {
  final int courseId;
  final String topicNameId;
  final String topicName;

  const TopicDetailsPage({
    super.key,
    required this.courseId,
    required this.topicNameId,
    required this.topicName,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TopicDetailsProvider(),
      child: _TopicDetailsView(
        courseId: courseId,
        topicNameId: topicNameId,
        topicName: topicName,
      ),
    );
  }
}

class _TopicDetailsView extends StatelessWidget {
  final int courseId;
  final String topicNameId;
  final String topicName;

  const _TopicDetailsView({
    required this.courseId,
    required this.topicNameId,
    required this.topicName,
  });

  @override
  Widget build(BuildContext context) {
    final topicDetailsProvider = Provider.of<TopicDetailsProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.grey[800];

    // Fetch topic details on first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!topicDetailsProvider.isLoading &&
          topicDetailsProvider.topicDetails == null) {
        topicDetailsProvider.fetchTopicDetails(
          courseId: courseId.toString(),
          topicNameId: topicNameId,
        );
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F46E5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          topicName,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<TopicDetailsProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.errorMessage!,
                      style: GoogleFonts.poppins(fontSize: 16, color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => provider.fetchTopicDetails(
                        courseId: courseId.toString(),
                        topicNameId: topicNameId,
                      ),
                      child: Text('Retry', style: GoogleFonts.poppins(fontSize: 14)),
                    ),
                  ],
                ),
              );
            }

            if (provider.topicDetails == null) {
              return Center(
                child: Text(
                  'No details available',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
                ),
              );
            }

            final topicDetails = provider.topicDetails!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topicDetails.topicName,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (topicDetails.description != null)
                    Text(
                      topicDetails.description!,
                      style: GoogleFonts.poppins(fontSize: 16, color: textColor),
                    ),
                  const SizedBox(height: 16),
                  if (topicDetails.content != null)
                    Text(
                      topicDetails.content!,
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
                    ),
                  const SizedBox(height: 16),
                  if (topicDetails.resources != null && topicDetails.resources!.isNotEmpty) ...[
                    Text(
                      'Resources',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    ...topicDetails.resources!.map(
                          (resource) => ListTile(
                        leading: const Icon(Icons.link),
                        title: Text(resource, style: GoogleFonts.poppins(fontSize: 14)),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Opening: $resource')),
                          );
                        },
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  if (topicDetails.lastUpdated != null)
                    Text(
                      'Last Updated: ${topicDetails.lastUpdated}',
                      style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
