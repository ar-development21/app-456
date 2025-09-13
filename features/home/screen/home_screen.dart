import 'package:flutter/material.dart';
import 'package:notesmedia/features/home/providers/home_provider.dart';
import 'package:notesmedia/features/home/widget/course_list.dart';
import 'package:notesmedia/features/home/widget/empty_state.dart';
import 'package:notesmedia/features/home/widget/error_state.dart';
import 'package:notesmedia/features/home/widget/featured_content_title.dart';
import 'package:notesmedia/features/home/widget/home_header.dart';
import 'package:notesmedia/features/home/widget/jee_prep_card.dart';
import 'package:notesmedia/features/home/widget/preference_dialog.dart';
import 'package:notesmedia/features/home/widget/progress_section.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 @override
  Widget build(BuildContext context) {
    /// Determine if dark mode is active
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      /// Use custom theme background from TColors
      backgroundColor: isDarkMode ? TColors.primaryBackground : TColors.white,
      body: const _HomeContentView(),
    );
  }
}


class _HomeContentView extends StatefulWidget {
  const _HomeContentView();

  @override
  State<_HomeContentView> createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<_HomeContentView> with TickerProviderStateMixin {
  String? _lastCheckedPreference;
  late AnimationController _listAnimationController;
  late AnimationController _shimmerController;
  final Map<String, IconData> _iconMap = {
    'computer': Icons.computer_rounded,
    'engineering': Icons.engineering_rounded,
    'book': Icons.book_rounded,
    'school': Icons.school_rounded,
    'storage': Icons.storage_rounded,
    'code': Icons.code_rounded,
    'data_object': Icons.data_object_rounded,
    'settings': Icons.settings_rounded,
    'image': Icons.image_rounded,
    'security': Icons.security_rounded,
    'network_check': Icons.network_check_rounded,
    'perm_media': Icons.perm_media_rounded,
    'account_balance': Icons.account_balance_rounded,
    'cloud': Icons.cloud_rounded,
    'phone_iphone': Icons.phone_iphone_rounded,
    'shopping_cart': Icons.shopping_cart_rounded,
    'chat': Icons.chat_rounded,
    'table_chart': Icons.table_chart_rounded,
    'web': Icons.web_rounded,
    'android': Icons.android_rounded,
  };

  @override
  void initState() {
    super.initState();
    _listAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _checkAndShowPreferenceDialog();
  }

  @override
  void dispose() {
    _listAnimationController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  Future<void> _checkAndShowPreferenceDialog() async {
    final prefs = await SharedPreferences.getInstance();
    final userPreference = prefs.getString('userPreference');
    final isFirstLaunch = userPreference == null || userPreference.isEmpty;
    if (isFirstLaunch && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showPreferenceDialog(context);
        }
      });
    }
  }

  Future<void> _showPreferenceDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PreferenceDialog(
          onPreferenceSaved: () {
            final _ = Provider.of<PreferenceProvider>(context, listen: false);
            _listAnimationController.forward();
          },
        );
      },
    );
  }

  Widget _buildBodyContent(BuildContext context, PreferenceProvider preferenceProvider) {
    if (preferenceProvider.isLoading) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _shimmerController,
            builder: (context, child) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[100]!,
                      Colors.grey[300]!,
                    ],
                    stops: const [0.1, 0.5, 0.9],
                    transform: _SlidingGradientTransform(
                      percent: _shimmerController.value,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey[400],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 16,
                            width: 150,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 13,
                            width: 100,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
    if (preferenceProvider.hasError) {
      return TErrorState(
        preferenceProvider: preferenceProvider,
        selectedPreference: preferenceProvider.userPreference,
      );
    }
    if (preferenceProvider.userPreference == "JEE Main") {
      return const TJeePrepCard();
    }
    if (preferenceProvider.courses.isEmpty) {
      return const TEmptyState();
    }
    return TCourseList(
      courses: preferenceProvider.courses,
      iconMap: _iconMap,
      listAnimationController: _listAnimationController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceProvider>(
      builder: (context, preferenceProvider, child) {
        final selectedPreference = preferenceProvider.userPreference;
        if (selectedPreference != _lastCheckedPreference) {
          _lastCheckedPreference = selectedPreference;
          if (selectedPreference.isNotEmpty) {
            _listAnimationController.forward();
          } else {
            _checkAndShowPreferenceDialog();
          }
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const THomeHeader(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TFeaturedContentTitle(title: selectedPreference),
                    const SizedBox(height: 20),
                    _buildBodyContent(context, preferenceProvider),
                    const SizedBox(height: 30),
                    const TProgressSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({required this.percent});
  final double percent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
      bounds.width * percent * 2 - bounds.width,
      0.0,
      0.0,
    );
  }
}