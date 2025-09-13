import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/home/providers/home_provider.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceDialog extends StatefulWidget {
  final VoidCallback onPreferenceSaved;

  const PreferenceDialog({super.key, required this.onPreferenceSaved});

  @override
  State<PreferenceDialog> createState() => _PreferenceDialogState();
}

class _PreferenceDialogState extends State<PreferenceDialog> with SingleTickerProviderStateMixin {
  String? _selectedPreference;
  bool _showEntranceSubOptions = false;
  bool _showGovtSubOptions = false;
  bool _isSaving = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _loadExistingPreference();
  }

  Future<void> _loadExistingPreference() async {
    final prefs = await SharedPreferences.getInstance();
    final storedPreference = prefs.getString('userPreference');
    if (storedPreference != null && storedPreference.isNotEmpty) {
      setState(() {
        _selectedPreference = storedPreference;
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _savePreferences() async {
    if (_selectedPreference == null) {
      setState(() => _errorMessage = "Please select a preference");
      return;
    }

    setState(() {
      _isSaving = true;
      _errorMessage = null;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('userId') ?? 0;

      if (userId == 0) {
        setState(() {
          _errorMessage = "Invalid user ID. Please log in again.";
          _isSaving = false;
        });
        return;
      }

      await Provider.of<PreferenceProvider>(context, listen: false)
          .savePreferenceToApi(userId, _selectedPreference!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Preference saved!",
              style: GoogleFonts.poppins(color: TColors.light),
            ),
            backgroundColor: TColors.primary,
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.of(context).pop();
        widget.onPreferenceSaved();
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Error: $e";
        _isSaving = false;
      });
    }
  }

  void _toggleEntranceSubOptions() {
    setState(() {
      _showEntranceSubOptions = !_showEntranceSubOptions;
      _showGovtSubOptions = false;
      if (_showEntranceSubOptions) {
        _animationController.forward(from: 0);
      } else {
        _animationController.reverse();
      }
    });
  }

  void _toggleGovtSubOptions() {
    setState(() {
      _showGovtSubOptions = !_showGovtSubOptions;
      _showEntranceSubOptions = false;
      if (_showGovtSubOptions) {
        _animationController.forward(from: 0);
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Theme.of(context).cardColor,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: TColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.school, color: TColors.primary, size: 32),
              ),
              const SizedBox(height: 16),
              Text(
                "Welcome to NotesMedia!",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Select your learning preference to personalize your experience:",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: isDarkMode ? TColors.greyLight : TColors.greyDark,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    _errorMessage!,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: isDarkMode ? TColors.errorDark : TColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              _buildPreferenceOption(title: "B.C.A", icon: Icons.computer),
              _buildPreferenceOption(title: "B.Tech", icon: Icons.engineering),
              _buildPreferenceOption(
                title: "Entrance Exam",
                icon: Icons.school,
                hasSubOptions: true,
                isExpanded: _showEntranceSubOptions,
                onTap: _toggleEntranceSubOptions,
              ),
              SizeTransition(
                sizeFactor: _animation,
                axisAlignment: -1.0,
                child: _showEntranceSubOptions
                    ? Column(
                  children: [
                    _buildSubPreferenceOption("JEE Main"),
                    _buildSubPreferenceOption("JEE Advance"),
                  ],
                )
                    : const SizedBox.shrink(),
              ),
              _buildPreferenceOption(
                title: "Govt Exam",
                icon: Icons.account_balance,
                hasSubOptions: true,
                isExpanded: _showGovtSubOptions,
                onTap: _toggleGovtSubOptions,
              ),
              SizeTransition(
                sizeFactor: _animation,
                axisAlignment: -1.0,
                child: _showGovtSubOptions
                    ? Column(
                  children: [
                    _buildSubPreferenceOption("RAS"),
                    _buildSubPreferenceOption("SSC"),
                  ],
                )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedPreference == null || _isSaving ? null : _savePreferences,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isSaving
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(TColors.light),
                    ),
                  )
                      : Text(
                    "Save Preference",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: TColors.light,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceOption({
    required String title,
    required IconData icon,
    bool hasSubOptions = false,
    bool isExpanded = false,
    VoidCallback? onTap,
  }) {
    final isSelected = _selectedPreference == title;
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        GestureDetector(
          onTap: hasSubOptions
              ? onTap
              : () {
            setState(() {
              _selectedPreference = isSelected ? null : title;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected && !hasSubOptions
                  ? TColors.primary.withOpacity(0.1)
                  : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected && !hasSubOptions
                    ? TColors.primary
                    : (isDarkMode ? TColors.greyDark : TColors.greyLight),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isSelected && !hasSubOptions
                      ? TColors.primary
                      : isDarkMode
                      ? TColors.greyLight
                      : TColors.greyDark,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (hasSubOptions)
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: isDarkMode ? TColors.greyLight : TColors.greyDark,
                  )
                else
                  Radio<String>(
                    value: title,
                    groupValue: _selectedPreference,
                    onChanged: (value) {
                      setState(() {
                        _selectedPreference = value;
                      });
                    },
                    activeColor: TColors.primary,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubPreferenceOption(String title) {
    final isSelected = _selectedPreference == title;
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPreference = isSelected ? null : title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? TColors.primary.withOpacity(0.1) : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? TColors.primary : (isDarkMode ? TColors.greyDark : TColors.greyLight),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 36),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Radio<String>(
              value: title,
              groupValue: _selectedPreference,
              onChanged: (value) {
                setState(() {
                  _selectedPreference = value;
                });
              },
              activeColor: TColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
