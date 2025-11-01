import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/utils/constants.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  String _selectedCategory = 'General';
  bool _isLoading = false;

  final List<String> _categories = [
    'General',
    'Farming Tips',
    'Equipment',
    'Crops',
    'Livestock',
    'Organic Farming',
    'Technology',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  /// -----------------------------------------------------------------
  /// UI/UX Improvement:
  /// Helper method to create a consistent InputDecoration
  /// for all form fields.
  /// -----------------------------------------------------------------
  InputDecoration _buildInputDecoration({
    required String labelText,
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icon(icon, color: AppColors.primaryGreen.withOpacity(0.8)),
      hintStyle: AppTextStyles.bodyText2.copyWith(color: AppColors.textLight),
      labelStyle: AppTextStyles.bodyText1.copyWith(
        color: AppColors.textPrimary,
      ),
      floatingLabelStyle: AppTextStyles.bodyText1.copyWith(
        color: AppColors.primaryGreen,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2.0),
      ),
      contentPadding: const EdgeInsets.all(AppConstants.paddingMedium),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // --- APP BAR REMAINS UNCHANGED AS REQUESTED ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.primaryGradient,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)?.createPost ?? 'Create Post',
          style: AppTextStyles.headline2.copyWith(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _handlePost,
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    'Post',
                    style: AppTextStyles.buttonText.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
          ),
        ],
      ),
      // --- BODY WITH UI/UX ENHANCEMENTS ---
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Form(
          // UI/UX: Wrap content in a Form widget for semantic correctness
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- UI/UX: Replaced with DropdownButtonFormField ---
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: _buildInputDecoration(
                  labelText:
                      AppLocalizations.of(context)?.category ?? 'Category',
                  hintText: 'Select a category',
                  icon: Iconsax.category,
                ),
                icon: Icon(Iconsax.arrow_down, color: AppColors.primaryGreen),
                isExpanded: true,
                style: AppTextStyles.bodyText1.copyWith(
                  color: AppColors.textPrimary,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                items: _categories.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // --- UI/UX: Replaced with TextFormField ---
              TextFormField(
                controller: _titleController,
                decoration: _buildInputDecoration(
                  labelText: AppLocalizations.of(context)?.title ?? 'Title',
                  hintText:
                      AppLocalizations.of(context)?.enterTitle ??
                      'Enter your post title...',
                  icon: Iconsax.text,
                ),
                maxLines: 1,
                textCapitalization: TextCapitalization.sentences,
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // --- UI/UX: Replaced with TextFormField ---
              TextFormField(
                controller: _contentController,
                decoration: _buildInputDecoration(
                  labelText: AppLocalizations.of(context)?.content ?? 'Content',
                  hintText:
                      AppLocalizations.of(context)?.shareKnowledge ??
                      'Share your farming knowledge, tips, or ask questions...',
                  icon: Iconsax.document_text,
                ),
                minLines: 5, // UI/UX: Give the text field a larger default size
                maxLines: 10,
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // --- UI/UX: Replaced with TextFormField ---
              TextFormField(
                controller: _tagsController,
                decoration: _buildInputDecoration(
                  labelText:
                      AppLocalizations.of(context)?.tags ?? 'Tags (optional)',
                  hintText:
                      AppLocalizations.of(context)?.addTags ??
                      'Add tags separated by commas (e.g., farming, tips)',
                  icon: Iconsax.tag,
                ),
              ),

              // --- UI/UX: Removed the redundant ElevatedButton ---
            ],
          ),
        ),
      ),
    );
  }

  void _handlePost() {
    if (_titleController.text.trim().isEmpty ||
        _contentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)?.fillAllFields ??
                'Please fill in title and content',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)?.postCreated ??
                'Post created successfully!',
          ),
          backgroundColor: AppColors.primaryGreen,
        ),
      );

      // Clear form
      _titleController.clear();
      _contentController.clear();
      _tagsController.clear();

      // Navigate back
      Navigator.of(context).pop();
    });
  }
}
