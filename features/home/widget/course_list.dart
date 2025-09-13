import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/Model/Course_model.dart';

class TCourseList extends StatelessWidget {
  final List<CourseModel> courses;
  final Map<String, IconData> iconMap;
  final AnimationController listAnimationController;

  const TCourseList({
    super.key,
    required this.courses,
    required this.iconMap,
    required this.listAnimationController,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final item = courses[index];
        final iconData = iconMap[item.iconName] ?? Icons.book_rounded;

        final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: listAnimationController,
            curve: Interval(
              (courses.isNotEmpty ? 1 / courses.length : 1.0) * index,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        );

        return AnimatedBuilder(
          animation: listAnimationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: animation,
              child: Transform.translate(
                offset: Offset(0.0, 50 * (1.0 - animation.value)),
                child: child,
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: isDarkMode ? TColors.black : TColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDarkMode ? TColors.darkGrey : TColors.borderPrimary,
              ),
              boxShadow: [
                BoxShadow(
                  color: TColors.grey.withOpacity(isDarkMode ? 0.4 : 0.4),
                  blurRadius: 6,
                  spreadRadius: 1,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  // TODO: Navigate to CourseTopicsPage with item
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: isDarkMode
                            ? TColors.darkGrey.withOpacity(0.9)
                            : TColors.primary.withOpacity(0.1),
                        child: Icon(
                          iconData,
                          size: 28,
                          color: TColors.primary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.courseName.isNotEmpty
                                  ? item.courseName
                                  : 'Unnamed Course',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isDarkMode
                                    ? TColors.textPrimary
                                    : TColors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.shortDescription.isNotEmpty
                                  ? item.shortDescription
                                  : 'Tap to explore this course',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: isDarkMode
                                    ? TColors.textSecondary
                                    : TColors.textSubtle,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: isDarkMode
                            ? TColors.textSecondary
                            : TColors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
