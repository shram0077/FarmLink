import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../l10n/app_localizations.dart';
import '../../models/expert.dart';
import '../../services/fake_data_service.dart';
import '../profile/expertPorifle/expertPorifle.dart';

class ViewSpecialites extends StatefulWidget {
  const ViewSpecialites({super.key});

  @override
  State<ViewSpecialites> createState() => _ViewSpecialitesState();
}

class _ViewSpecialitesState extends State<ViewSpecialites> {
  // Search controller
  final TextEditingController _searchController = TextEditingController();

  // All experts data - now using the service
  List<Expert> get allExperts => FakeDataService.getAllExperts();

  // Filtered experts list
  List<Expert> get filteredExperts {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      return allExperts;
    }
    return allExperts.where((expert) {
      final nameMatch = expert.name.toLowerCase().contains(query);
      final specialtyMatch = expert.specialties.any(
        (specialty) => specialty.toLowerCase().contains(query),
      );
      return nameMatch || specialtyMatch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          // Enhanced decorative circles
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFF4CAF50).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF66BB6A).withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFF4CAF50).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF66BB6A).withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Header section with title and back button
                  _buildHeader(),
                  const SizedBox(height: 24),
                  // Search Bar
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  // Grid of experts or no results message
                  Expanded(
                    child: filteredExperts.isEmpty
                        ? _buildEmptyState()
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 cards per row
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio:
                                      0.8, // Responsive aspect ratio
                                ),
                            itemCount: filteredExperts.length,
                            itemBuilder: (context, index) {
                              return _buildExpertCard(filteredExperts[index]);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Back button
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Iconsax.arrow_left, size: 20),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(width: 60),
        // Title
        Text(
          AppLocalizations.of(context)?.appName ?? 'Agro link',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        // const Spacer(),
        // Subtitle
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        //   decoration: BoxDecoration(
        //     color: const Color(0xFF4CAF50).withOpacity(0.1),
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        //   child: Text(
        //     AppLocalizations.of(context)?.agriculturalExperts ?? 'Agricultural Experts',
        //     style: TextStyle(
        //       fontSize: 12,
        //       fontWeight: FontWeight.w600,
        //       color: Color(0xFF4CAF50),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Iconsax.search_status,
              size: 64,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context)?.noExpertsFound ?? 'No experts found',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)?.tryAdjustingSearch ??
                'Try adjusting your search terms',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  /// Builds the search bar widget.
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText:
              AppLocalizations.of(context)?.searchExperts ??
              'Search experts or specialties...',
          prefixIcon: const Icon(Iconsax.search_normal, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(Iconsax.close_circle, color: Colors.grey),
            onPressed: () {
              _searchController.clear();
              setState(() {});
            },
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  /// Builds a card for a single expert.
  Widget _buildExpertCard(Expert expert) {
    return GestureDetector(
      onTap: () {
        _navigateToExpertProfile(expert);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar section
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(expert.imageUrl),
                  onBackgroundImageError: (exception, stackTrace) {
                    // Handle error silently
                  },
                  backgroundColor: Colors.orange[100],
                ),
              ),
              const SizedBox(height: 8),

              // Expert Name - flexible height
              Flexible(
                child: Text(
                  expert.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 6),

              // "Expert in" label
              Text(
                '${AppLocalizations.of(context)?.expertIn ?? 'Expert In'}:',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006400),
                ),
              ),
              const SizedBox(height: 4),

              // Specialties - flexible container
              Flexible(
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 40,
                    maxHeight: 60,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: expert.specialties.length > 2
                              ? 2
                              : expert.specialties.length,
                          itemBuilder: (context, index) {
                            if (index == 1 && expert.specialties.length > 2) {
                              return Text(
                                '• ${expert.specialties[index]}...',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            }
                            return Text(
                              '• ${expert.specialties[index]}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Spacer to push icon to bottom
              const Spacer(),

              // Dropdown icon at the bottom
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Iconsax.arrow_down,
                  color: Colors.grey[600],
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigate to expert profile screen
  void _navigateToExpertProfile(Expert expert) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExpertProfile(expert: expert)),
    );
  }
}
