import '../models/expert.dart';
import '../models/chat_message.dart';
import '../models/post.dart';
import '../models/product.dart';
import '../models/ai_message.dart';

class FakeDataService {
  static const Map<String, String> fakeUserData = {
    'fullName': 'John Farmer',
    'email': 'john.farmer@example.com',
    'phone': '+1-555-0123',
    'password': 'password123',
  };

  static const Map<String, String> fakeLoginData = {
    'email': 'john.farmer@example.com',
    'password': 'password123',
  };

  static const Map<String, String> fakePhoneData = {'phone': '+1-555-0123'};

  // Expert data
  static const List<Map<String, dynamic>> _fakeExpertsData = [
    {
      'name': 'Bilal Mustafa',
      'imageUrl': 'https://placehold.co/140x140/FFDDC1/000000?text=BM',
      'specialties': [
        'Crop Advisory',
        'Agricultural Consulting',
        'Farm Management',
      ],
      'address': 'kalar,sulaimanyah,kurdistan',
      'workDescription': 'advice crop',
      'phoneNumber': '+964-750-123-4567',
      'email': 'bilal.mustafa@example.com',
    },
    {
      'name': 'Prof. Michael Chen',
      'imageUrl':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Agricultural Engineering',
        'Precision Farming',
        'Irrigation Systems',
      ],
      'address': 'University of California, Davis, CA',
      'workDescription':
          'Leading research in smart irrigation systems and precision agriculture technologies to optimize water usage and crop yields.',
      'phoneNumber': '+1-530-752-0100',
      'email': 'mchen@ucdavis.edu',
    },
    {
      'name': 'Dr. Elena Rodriguez',
      'imageUrl':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Plant Pathology',
        'Disease Management',
        'Organic Farming',
      ],
      'address': 'Cornell University, Ithaca, NY',
      'workDescription':
          'Specializing in plant disease diagnosis and sustainable farming practices to help farmers maintain healthy crops organically.',
      'phoneNumber': '+1-607-255-2131',
      'email': 'erodriguez@cornell.edu',
    },
    {
      'name': 'Dr. James Wilson',
      'imageUrl':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Animal Nutrition',
        'Livestock Management',
        'Feed Formulation',
      ],
      'address': 'Texas A&M University, College Station, TX',
      'workDescription':
          'Expert in livestock nutrition and feed formulation, helping farmers optimize animal health and productivity.',
      'phoneNumber': '+1-979-845-1542',
      'email': 'jwilson@tamu.edu',
    },
    {
      'name': 'Prof. Amara Okafor',
      'imageUrl':
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Agricultural Economics',
        'Farm Management',
        'Market Analysis',
      ],
      'address': 'University of Nigeria, Nsukka',
      'workDescription':
          'Agricultural economist focusing on farm management strategies and market analysis for small-scale farmers.',
      'phoneNumber': '+234-803-123-4567',
      'email': 'aokafor@unn.edu.ng',
    },
    {
      'name': 'Dr. Robert Thompson',
      'imageUrl':
          'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Horticulture',
        'Greenhouse Management',
        'Controlled Environment Agriculture',
      ],
      'address': 'University of Arizona, Tucson, AZ',
      'workDescription':
          'Horticulture specialist with expertise in greenhouse management and controlled environment agriculture.',
      'phoneNumber': '+1-520-621-1152',
      'email': 'rthompson@arizona.edu',
    },
    {
      'name': 'Dr. Lisa Park',
      'imageUrl':
          'https://images.unsplash.com/photo-1551836022-deb4988cc6c0?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Food Safety',
        'Quality Control',
        'Post-Harvest Technology',
      ],
      'address': 'UC Davis, Department of Food Science, CA',
      'workDescription':
          'Food safety expert specializing in quality control and post-harvest technology to ensure safe food products.',
      'phoneNumber': '+1-530-752-1465',
      'email': 'lpark@ucdavis.edu',
    },
    {
      'name': 'Prof. David Kumar',
      'imageUrl':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Agricultural Biotechnology',
        'Genetic Engineering',
        'Crop Improvement',
      ],
      'address': 'Purdue University, West Lafayette, IN',
      'workDescription':
          'Biotechnology researcher working on genetic crop improvement and development of disease-resistant varieties.',
      'phoneNumber': '+1-765-494-1314',
      'email': 'dkumar@purdue.edu',
    },
    {
      'name': 'Dr. Maria Santos',
      'imageUrl':
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Agroforestry',
        'Sustainable Land Management',
        'Carbon Sequestration',
      ],
      'address': 'EMBRAPA, Brasília, Brazil',
      'workDescription':
          'Agroforestry specialist focusing on sustainable land management and carbon sequestration in agricultural systems.',
      'phoneNumber': '+55-61-3448-4433',
      'email': 'msantos@embrapa.br',
    },
    {
      'name': 'Dr. Ahmed Hassan',
      'imageUrl':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Water Management',
        'Drought Resistance',
        'Climate Smart Agriculture',
      ],
      'address': 'ICARDA, Cairo, Egypt',
      'workDescription':
          'Water management expert specializing in drought-resistant crops and climate-smart agricultural practices.',
      'phoneNumber': '+20-2-3762-1234',
      'email': 'ahassan@icarda.org',
    },
    {
      'name': 'Prof. Catherine Lee',
      'imageUrl':
          'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Agricultural Policy',
        'Rural Development',
        'Extension Services',
      ],
      'address': 'World Bank, Washington, DC',
      'workDescription':
          'Agricultural policy expert working on rural development programs and agricultural extension services.',
      'phoneNumber': '+1-202-473-1000',
      'email': 'clee@worldbank.org',
    },
    {
      'name': 'Dr. Thomas Anderson',
      'imageUrl':
          'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=150&h=150&fit=crop&crop=face',
      'specialties': [
        'Pest Management',
        'Integrated Pest Control',
        'Biological Control',
      ],
      'address': 'University of Florida, Gainesville, FL',
      'workDescription':
          'Pest management specialist developing integrated pest control strategies using biological control methods.',
      'phoneNumber': '+1-352-392-1901',
      'email': 'tanderson@ufl.edu',
    },
  ];

  static String getFakeData(String key) {
    return {...fakeUserData, ...fakeLoginData, ...fakePhoneData}[key] ?? '';
  }

  static Map<String, String> getAllFakeUserData() {
    return Map.from(fakeUserData);
  }

  static Map<String, String> getAllFakeLoginData() {
    return Map.from(fakeLoginData);
  }

  static Map<String, String> getAllFakePhoneData() {
    return Map.from(fakePhoneData);
  }

  // Expert-related methods
  static List<Expert> getAllExperts() {
    return _fakeExpertsData.map((data) => Expert.fromJson(data)).toList();
  }

  static Expert getExpertByName(String name) {
    final expertData = _fakeExpertsData
        .where((data) => data['name'] == name)
        .toList();
    if (expertData.isNotEmpty) {
      return Expert.fromJson(expertData.first);
    }
    throw Exception('Expert not found: $name');
  }

  static List<Expert> getExpertsBySpecialty(String specialty) {
    return _fakeExpertsData
        .where((data) => (data['specialties'] as List).contains(specialty))
        .map((data) => Expert.fromJson(data))
        .toList();
  }

  static Expert getDefaultExpert() {
    return Expert.fromJson(_fakeExpertsData.first);
  }

  // Chat-related fake data
  static const List<Map<String, dynamic>> _fakeChatMessages = [
    {
      'id': '1',
      'senderId': 'expert_1',
      'senderName': 'Bilal Mustafa',
      'message':
          'Hello! I\'m happy to help you with your agricultural questions. What would you like to know about crop management?',
      'timestamp': '2024-01-15T10:00:00Z',
      'isFromExpert': true,
      'type': 'text',
    },
    {
      'id': '2',
      'senderId': 'user_1',
      'senderName': 'John Farmer',
      'message':
          'Hi Dr. Mustafa! I\'m having issues with my tomato plants. The leaves are turning yellow and some plants are wilting.',
      'timestamp': '2024-01-15T10:05:00Z',
      'isFromExpert': false,
      'type': 'text',
    },
    {
      'id': '3',
      'senderId': 'expert_1',
      'senderName': 'Bilal Mustafa',
      'message':
          'Yellow leaves on tomato plants can indicate several issues. Could you tell me more about your watering schedule and soil conditions?',
      'timestamp': '2024-01-15T10:10:00Z',
      'isFromExpert': true,
      'type': 'text',
    },
    {
      'id': '4',
      'senderId': 'user_1',
      'senderName': 'John Farmer',
      'message':
          'I water them every other day, and the soil seems to drain well. I\'ve also noticed some spots on the leaves.',
      'timestamp': '2024-01-15T10:15:00Z',
      'isFromExpert': false,
      'type': 'text',
    },
    {
      'id': '5',
      'senderId': 'expert_1',
      'senderName': 'Bilal Mustafa',
      'message':
          'Based on your description, this sounds like it could be early blight or a nutrient deficiency. Let me give you some specific recommendations...',
      'timestamp': '2024-01-15T10:20:00Z',
      'isFromExpert': true,
      'type': 'text',
    },
    {
      'id': '6',
      'senderId': 'expert_1',
      'senderName': 'Bilal Mustafa',
      'message':
          '1. Reduce watering frequency to every 3-4 days\n2. Apply a balanced fertilizer with micronutrients\n3. Remove affected leaves and dispose of them\n4. Ensure good air circulation around plants',
      'timestamp': '2024-01-15T10:25:00Z',
      'isFromExpert': true,
      'type': 'text',
    },
    {
      'id': '7',
      'senderId': 'user_1',
      'senderName': 'John Farmer',
      'message':
          'Thank you so much for the detailed advice! I\'ll implement these changes right away. Should I be concerned about the spots spreading to other plants?',
      'timestamp': '2024-01-15T10:30:00Z',
      'isFromExpert': false,
      'type': 'text',
    },
    {
      'id': '8',
      'senderId': 'expert_1',
      'senderName': 'Bilal Mustafa',
      'message':
          'Yes, early blight can spread, so it\'s important to act quickly. You might also want to consider applying a fungicide if the problem persists. Feel free to send me photos of your plants for a more accurate diagnosis!',
      'timestamp': '2024-01-15T10:35:00Z',
      'isFromExpert': true,
      'type': 'text',
    },
  ];

  // Post-related fake data
  static const List<Map<String, dynamic>> _fakePostsData = [
    {
      'id': '1',
      'title': 'Best Practices for Tomato Cultivation in Dry Climate',
      'content':
          'Tomato cultivation in dry climates requires careful attention to irrigation and soil management. Here are the key strategies that have worked well for me:\n\n1. Drip irrigation systems save water and reduce disease\n2. Mulching helps retain soil moisture\n3. Choose drought-resistant varieties\n4. Monitor soil pH regularly\n\nThese practices have increased my yield by 40% compared to traditional methods.',
      'category': 'Crops',
      'tags': ['tomatoes', 'irrigation', 'dry-climate', 'organic'],
      'authorName': 'Ahmed Hassan',
      'authorImageUrl':
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=150&h=150&fit=crop&crop=face',
      'timestamp': '2024-01-15T08:30:00Z',
      'likesCount': 24,
      'commentsCount': 8,
      'isLikedByCurrentUser': false,
    },
    {
      'id': '2',
      'title': 'Organic Pest Control Methods That Actually Work',
      'content':
          'After years of experimenting with different pest control methods, I\'ve found these organic approaches to be most effective:\n\n• Neem oil spray for aphids and whiteflies\n• Beneficial insects like ladybugs\n• Companion planting with marigolds\n• Garlic and pepper sprays for larger pests\n\nThe key is prevention rather than reaction. Start early in the season!',
      'category': 'Organic Farming',
      'tags': ['organic', 'pest-control', 'sustainable', 'natural'],
      'authorName': 'Elena Rodriguez',
      'authorImageUrl':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      'timestamp': '2024-01-14T14:20:00Z',
      'likesCount': 31,
      'commentsCount': 12,
      'isLikedByCurrentUser': true,
    },
    {
      'id': '3',
      'title': 'Maximizing Livestock Feed Efficiency',
      'content':
          'Feed costs represent the largest expense in livestock operations. Here are proven strategies to optimize feed efficiency:\n\n1. Proper nutrition formulation based on animal needs\n2. Regular feed analysis and quality control\n3. Implementing phase feeding programs\n4. Using feed additives wisely\n\nThese approaches can reduce feed costs by 15-20% while maintaining animal performance.',
      'category': 'Livestock',
      'tags': ['livestock', 'feed-efficiency', 'cost-reduction', 'nutrition'],
      'authorName': 'James Wilson',
      'authorImageUrl':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
      'timestamp': '2024-01-13T10:45:00Z',
      'likesCount': 18,
      'commentsCount': 6,
      'isLikedByCurrentUser': false,
    },
    {
      'id': '4',
      'title': 'Smart Irrigation Technology for Modern Farms',
      'content':
          'Precision irrigation technology has revolutionized water management in agriculture. The latest systems offer:\n\n• Soil moisture sensors for real-time monitoring\n• Weather-based irrigation scheduling\n• Variable rate irrigation\n• Mobile app integration for remote control\n\nROI is typically achieved within 2-3 seasons through water and energy savings.',
      'category': 'Technology',
      'tags': [
        'smart-irrigation',
        'precision-ag',
        'water-management',
        'technology',
      ],
      'authorName': 'Michael Chen',
      'authorImageUrl':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      'timestamp': '2024-01-12T16:15:00Z',
      'likesCount': 42,
      'commentsCount': 15,
      'isLikedByCurrentUser': true,
    },
    {
      'id': '5',
      'title': 'Seasonal Crop Rotation Strategies',
      'content':
          'Effective crop rotation is essential for soil health and pest management. Here\'s my 4-year rotation plan:\n\nYear 1: Legumes (nitrogen fixation)\nYear 2: Leafy vegetables (nitrogen users)\nYear 3: Fruit crops (heavy feeders)\nYear 4: Root vegetables (soil breakers)\n\nThis system has maintained soil fertility without synthetic fertilizers for over a decade.',
      'category': 'Crops',
      'tags': ['crop-rotation', 'soil-health', 'sustainability', 'organic'],
      'authorName': 'Maria Santos',
      'authorImageUrl':
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face',
      'timestamp': '2024-01-11T09:00:00Z',
      'likesCount': 27,
      'commentsCount': 9,
      'isLikedByCurrentUser': false,
    },
    {
      'id': '6',
      'title': 'Farm Equipment Maintenance Schedule',
      'content':
          'Proper equipment maintenance prevents costly breakdowns and extends machinery life. Here\'s my comprehensive maintenance schedule:\n\nDaily: Clean and inspect\nWeekly: Check fluids and filters\nMonthly: Lubricate moving parts\nSeasonally: Comprehensive service\n\nInvesting time in maintenance saves money on repairs and downtime.',
      'category': 'Equipment',
      'tags': ['equipment', 'maintenance', 'farm-management', 'efficiency'],
      'authorName': 'Bilal Mustafa',
      'authorImageUrl': 'https://placehold.co/140x140/FFDDC1/000000?text=BM',
      'timestamp': '2024-01-10T13:30:00Z',
      'likesCount': 15,
      'commentsCount': 4,
      'isLikedByCurrentUser': false,
    },
  ];

  // Chat-related methods
  static List<ChatMessage> getChatMessagesForExpert(String expertName) {
    return _fakeChatMessages.map((data) => ChatMessage.fromJson(data)).toList();
  }

  static ChatMessage createNewMessage({
    required String message,
    required String expertName,
    required bool isFromExpert,
  }) {
    final expert = getExpertByName(expertName);
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: isFromExpert ? 'expert_1' : 'user_1',
      senderName: isFromExpert ? expert.name : 'John Farmer',
      message: message,
      timestamp: DateTime.now(),
      isFromExpert: isFromExpert,
    );
  }

  // Post-related methods
  static List<Post> getAllPosts() {
    return _fakePostsData.map((data) => Post.fromJson(data)).toList();
  }

  static List<Post> getPostsByCategory(String category) {
    return _fakePostsData
        .where((data) => data['category'] == category)
        .map((data) => Post.fromJson(data))
        .toList();
  }

  static Post getPostById(String id) {
    final postData = _fakePostsData.where((data) => data['id'] == id).toList();
    if (postData.isNotEmpty) {
      return Post.fromJson(postData.first);
    }
    throw Exception('Post not found: $id');
  }

  static List<Post> getRecentPosts({int limit = 10}) {
    final posts = getAllPosts();
    posts.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return posts.take(limit).toList();
  }

  // Fake Products Data
  static const List<Map<String, dynamic>> _fakeProductsData = [
    {
      'id': '1',
      'name': 'Organic Fertilizer - 5kg',
      'description':
          'Premium organic fertilizer made from natural compost and plant extracts. Perfect for vegetables and fruits.',
      'price': 25.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=400&fit=crop',
      'category': 'Fertilizers',
      'sellerName': 'Green Farms Co.',
      'sellerImageUrl':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop&crop=face',
      'rating': 4.8,
      'reviewCount': 156,
      'isAvailable': true,
      'isFarmerProduct': true,
      'tags': ['organic', 'fertilizer', 'vegetables', 'fruits'],
    },
    {
      'id': '2',
      'name': 'Drip Irrigation Kit - 50m',
      'description':
          'Complete drip irrigation system with timer and pressure regulator. Save water and improve crop yield.',
      'price': 89.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=400&h=400&fit=crop',
      'category': 'Irrigation',
      'sellerName': 'AgriTech Solutions',
      'sellerImageUrl':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
      'rating': 4.6,
      'reviewCount': 89,
      'isAvailable': true,
      'isFarmerProduct': false,
      'tags': ['irrigation', 'drip', 'water-saving', 'automation'],
    },
    {
      'id': '3',
      'name': 'Seed Starter Trays - Set of 10',
      'description':
          'Professional seed starting trays with drainage holes and humidity domes. Perfect for greenhouse use.',
      'price': 15.50,
      'imageUrl':
          'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=400&fit=crop',
      'category': 'Seedlings',
      'sellerName': 'Garden Pro Supplies',
      'sellerImageUrl':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop&crop=face',
      'rating': 4.4,
      'reviewCount': 67,
      'isAvailable': true,
      'isFarmerProduct': true,
      'tags': ['seeds', 'trays', 'greenhouse', 'starter'],
    },
    {
      'id': '4',
      'name': 'Pesticide Sprayer - 20L',
      'description':
          'Heavy-duty pesticide sprayer with adjustable nozzle and comfortable shoulder strap. Battery-powered.',
      'price': 45.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=400&fit=crop',
      'category': 'Equipment',
      'sellerName': 'Farm Equipment Plus',
      'sellerImageUrl':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop&crop=face',
      'rating': 4.7,
      'reviewCount': 203,
      'isAvailable': true,
      'isFarmerProduct': false,
      'tags': ['sprayer', 'pesticide', 'equipment', 'battery'],
    },
    {
      'id': '5',
      'name': 'Greenhouse Plastic Cover - 6x4m',
      'description':
          'UV-resistant greenhouse plastic cover with 4mm thickness. Provides optimal light transmission.',
      'price': 34.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?w=400&h=400&fit=crop',
      'category': 'Greenhouse',
      'sellerName': 'Climate Control Systems',
      'sellerImageUrl':
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop&crop=face',
      'rating': 4.5,
      'reviewCount': 94,
      'isAvailable': true,
      'isFarmerProduct': true,
      'tags': ['greenhouse', 'plastic', 'UV-resistant', 'cover'],
    },
    {
      'id': '6',
      'name': 'Soil pH Testing Kit',
      'description':
          'Complete soil testing kit with pH meter, moisture sensor, and nutrient indicators. Easy to use.',
      'price': 19.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?w=400&h=400&fit=crop',
      'category': 'Testing',
      'sellerName': 'Soil Science Labs',
      'sellerImageUrl':
          'https://images.unsplash.com/photo-1551836022-deb4988cc6c0?w=100&h=100&fit=crop&crop=face',
      'rating': 4.3,
      'reviewCount': 128,
      'isAvailable': true,
      'isFarmerProduct': false,
      'tags': ['soil-test', 'pH', 'moisture', 'nutrients'],
    },
  ];

  static List<Product> getFarmerProducts() {
    return _fakeProductsData
        .where((data) => data['isFarmerProduct'] == true)
        .map((data) => Product.fromJson(data))
        .toList();
  }

  static List<Product> getAllProducts() {
    return _fakeProductsData.map((data) => Product.fromJson(data)).toList();
  }

  static List<Product> getProductsByCategory(String category) {
    return _fakeProductsData
        .where((data) => data['category'] == category)
        .map((data) => Product.fromJson(data))
        .toList();
  }

  static Product getProductById(String id) {
    final productData = _fakeProductsData
        .where((data) => data['id'] == id)
        .toList();
    if (productData.isNotEmpty) {
      return Product.fromJson(productData.first);
    }
    throw Exception('Product not found: $id');
  }

  // Fake AI Messages Data
  static const List<Map<String, dynamic>> _fakeAIMessages = [
    {
      'id': '1',
      'message': 'Hello! How can I help you with your farming questions today?',
      'timestamp': '2024-01-15T10:00:00Z',
      'isFromAI': true,
    },
    {
      'id': '2',
      'message':
          'Hi! I need advice on tomato diseases. My plants have yellow spots on the leaves.',
      'timestamp': '2024-01-15T10:05:00Z',
      'isFromAI': false,
      'aiResponse':
          'Yellow spots on tomato leaves can indicate several issues. The most common causes are:\n\n1. **Early Blight**: Dark spots with yellow halos\n2. **Late Blight**: Water-soaked spots that turn brown\n3. **Nutrient Deficiency**: Usually magnesium or potassium\n\nCan you describe the spots in more detail? Are they on older or newer leaves?',
    },
    {
      'id': '3',
      'message':
          'The spots are on older leaves and have dark centers with yellow edges. The plant is about 2 months old.',
      'timestamp': '2024-01-15T10:10:00Z',
      'isFromAI': false,
      'aiResponse':
          'Based on your description, this sounds like **Early Blight** (Alternaria solani), which is very common in tomatoes.\n\n**Immediate Actions:**\n1. Remove affected leaves immediately\n2. Improve air circulation around plants\n3. Avoid overhead watering\n4. Apply copper-based fungicide if available\n\n**Prevention:**\n- Space plants 2-3 feet apart\n- Water at soil level\n- Mulch around plants\n- Rotate crops next season\n\nWould you like me to suggest specific organic treatments?',
    },
    {
      'id': '4',
      'message': 'Yes, please suggest organic treatments for early blight.',
      'timestamp': '2024-01-15T10:15:00Z',
      'isFromAI': false,
      'aiResponse':
          'Great! Here are effective organic treatments for early blight:\n\n**🍅 Homemade Fungicide Spray:**\n• 1 gallon water\n• 1 tsp baking soda\n• 1 tsp vegetable oil\n• 1 tsp dish soap\n\nSpray every 7-10 days, especially after rain.\n\n**🧄 Garlic Spray:**\n• Blend 2 bulbs garlic with water\n• Strain and add 1 tsp soap\n• Dilute 1:10 with water\n\n**🧅 Onion Spray:**\n• Soak chopped onions in water overnight\n• Strain and spray directly\n\n**Prevention Tips:**\n• Stake plants for better air flow\n• Remove lower leaves touching soil\n• Clean up plant debris in fall\n\nApply treatments early morning or evening to avoid leaf burn.',
    },
    {
      'id': '5',
      'message': 'What about irrigation scheduling for tomatoes?',
      'timestamp': '2024-01-15T10:20:00Z',
      'isFromAI': false,
      'aiResponse':
          'Excellent question! Proper irrigation is crucial for tomato health.\n\n**🌱 Tomato Watering Schedule:**\n\n**Seedlings (first 2 weeks):**\n- Water daily, keep soil moist but not soggy\n- Use gentle spray to avoid disturbing roots\n\n**Young Plants (weeks 3-6):**\n- Water every 2-3 days\n- 1-2 inches per week total\n- Deep watering encourages strong roots\n\n**Mature Plants (weeks 7+):**\n- Water deeply 2-3 times per week\n- 1.5-2 gallons per plant per session\n- Allow top 2 inches of soil to dry between waterings\n\n**💧 Best Practices:**\n• Water at soil level to avoid fungal diseases\n• Morning watering reduces evaporation\n• Use mulch to retain moisture\n• Install drip irrigation for consistency\n• Monitor soil moisture with finger test (dry 2 inches down = time to water)\n\n**⚠️ Warning Signs:**\n- Wilting leaves = underwatered\n- Yellow leaves = overwatered\n- Cracked fruit = inconsistent watering\n\nWould you like specific recommendations for your climate?',
    },
  ];

  static List<AIMessage> getAIMessages() {
    return _fakeAIMessages.map((data) => AIMessage.fromJson(data)).toList();
  }

  static AIMessage createNewAIMessage({
    required String message,
    required bool isFromAI,
    String? aiResponse,
  }) {
    return AIMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: message,
      timestamp: DateTime.now(),
      isFromAI: isFromAI,
      aiResponse: aiResponse,
    );
  }

  static String generateAIResponse(String userMessage) {
    // Simple keyword-based responses for demo purposes
    final message = userMessage.toLowerCase();

    if (message.contains('tomato') || message.contains('tomatoes')) {
      return 'Tomatoes are one of the most popular crops! For healthy tomato plants:\n\n• Plant in full sun (6-8 hours daily)\n• Space plants 2-3 feet apart\n• Water deeply but infrequently\n• Use stakes or cages for support\n• Mulch to retain moisture and suppress weeds\n\nWhat specific tomato issue are you facing?';
    }

    if (message.contains('fertilizer') || message.contains('nutrient')) {
      return 'Proper fertilization is key to healthy crops! Here\'s a general guide:\n\n**Nitrogen (N)**: Leaf growth, green color\n**Phosphorus (P)**: Root development, flowering\n**Potassium (K)**: Fruit quality, disease resistance\n\n**Organic Options:**\n• Compost tea\n• Bone meal (for phosphorus)\n• Wood ash (for potassium)\n• Fish emulsion\n\nTest your soil pH first - most plants prefer 6.0-7.0 pH range.';
    }

    if (message.contains('pest') || message.contains('insect')) {
      return 'Integrated Pest Management (IPM) is the best approach:\n\n**Prevention First:**\n• Plant companion plants (marigolds, basil)\n• Encourage beneficial insects\n• Maintain plant health\n• Crop rotation\n\n**Natural Controls:**\n• Neem oil spray\n• Insecticidal soap\n• Diatomaceous earth\n• Beneficial insects (ladybugs, lacewings)\n\n**When to Treat:** Only when pest population exceeds economic threshold!';
    }

    if (message.contains('water') || message.contains('irrigation')) {
      return 'Efficient irrigation saves water and improves yields:\n\n**Methods:**\n• Drip irrigation (most efficient)\n• Soaker hoses\n• Sprinklers (least efficient)\n\n**When to Water:**\n• Early morning or evening\n• When top 1-2 inches of soil are dry\n• Deep, infrequent watering\n\n**Signs of Problems:**\n• Wilting leaves = underwatered\n• Yellow leaves = overwatered\n• Slow growth = inconsistent watering';
    }

    if (message.contains('soil') || message.contains('ph')) {
      return 'Soil health is fundamental to successful farming:\n\n**Soil Testing:** Get your soil tested annually for:\n• pH level\n• Nutrient content (NPK)\n• Organic matter\n• Texture (sand/silt/clay)\n\n**pH Adjustment:**\n• Add lime to raise pH (acidic soil)\n• Add sulfur to lower pH (alkaline soil)\n\n**Improvement:**\n• Add organic matter annually\n• Practice crop rotation\n• Minimize tillage\n• Use cover crops';
    }

    // Default response
    return 'I\'m here to help with your farming questions! I can assist with:\n\n• Crop disease diagnosis\n• Fertilizer recommendations\n• Pest management\n• Irrigation scheduling\n• Soil health\n• Equipment advice\n• Organic farming practices\n\nWhat specific farming topic would you like to know more about?';
  }
}
