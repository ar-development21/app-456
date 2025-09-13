import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/notifications/providers/notification_provider.dart';
import 'package:notesmedia/features/notifications/widgets/notification_tile.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return ChangeNotifierProvider(
      create: (_) => NotificationProvider()..fetchNotifications(),
      child: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          if (provider.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(provider.errorMessage!)),
              );
            });
          }

          return Scaffold(
            backgroundColor: isDarkMode ? TColors.black : TColors.white,
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 2,
              shadowColor: Colors.black.withOpacity(0.2),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                "Notifications",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () => provider.fetchNotifications(),
              color: Theme.of(context).primaryColor,
              child: provider.notifications.isEmpty
                  ? ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Text(
                        "No notifications yet",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: isDarkMode
                              ? TColors.greyLight
                              : TColors.greyDark,
                        ),
                      ),
                    ),
                  )
                ],
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(12.0),
                itemCount: provider.notifications.length,
                itemBuilder: (context, index) {
                  final notification = provider.notifications[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? TColors.darkGrey.withOpacity(0.9)
                          : TColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: NotificationTile(
                      notification: notification,
                      onTap: () => provider.markAsRead(notification),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
