import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ku.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ku')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'FarmLink'**
  String get appName;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @signInWith.
  ///
  /// In en, this message translates to:
  /// **'sign in with'**
  String get signInWith;

  /// No description provided for @startWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Start with Email'**
  String get startWithEmail;

  /// No description provided for @startWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Start with Phone'**
  String get startWithPhone;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'SEND'**
  String get send;

  /// No description provided for @createPost.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get createPost;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags (optional)'**
  String get tags;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @farmingTips.
  ///
  /// In en, this message translates to:
  /// **'Farming Tips'**
  String get farmingTips;

  /// No description provided for @equipment.
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get equipment;

  /// No description provided for @crops.
  ///
  /// In en, this message translates to:
  /// **'Crops'**
  String get crops;

  /// No description provided for @livestock.
  ///
  /// In en, this message translates to:
  /// **'Livestock'**
  String get livestock;

  /// No description provided for @organicFarming.
  ///
  /// In en, this message translates to:
  /// **'Organic Farming'**
  String get organicFarming;

  /// No description provided for @technology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technology;

  /// No description provided for @market.
  ///
  /// In en, this message translates to:
  /// **'Market'**
  String get market;

  /// No description provided for @ai.
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get ai;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @noExpertsFound.
  ///
  /// In en, this message translates to:
  /// **'No experts found'**
  String get noExpertsFound;

  /// No description provided for @tryAdjustingSearch.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters'**
  String get tryAdjustingSearch;

  /// No description provided for @searchExperts.
  ///
  /// In en, this message translates to:
  /// **'Search experts or specialties...'**
  String get searchExperts;

  /// No description provided for @expertIn.
  ///
  /// In en, this message translates to:
  /// **'Expert In:'**
  String get expertIn;

  /// No description provided for @callForAdvice.
  ///
  /// In en, this message translates to:
  /// **'Call for Advice'**
  String get callForAdvice;

  /// No description provided for @chatForAdvice.
  ///
  /// In en, this message translates to:
  /// **'Chat for Advice'**
  String get chatForAdvice;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @workDescription.
  ///
  /// In en, this message translates to:
  /// **'Work Description'**
  String get workDescription;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get notAvailable;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// No description provided for @pleaseTypeCode.
  ///
  /// In en, this message translates to:
  /// **'Please type the verification code sent to'**
  String get pleaseTypeCode;

  /// No description provided for @dontReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'I don\'t receive a code! Please resend'**
  String get dontReceiveCode;

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// No description provided for @enterPhoneToVerify.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to verify your account'**
  String get enterPhoneToVerify;

  /// No description provided for @specialists.
  ///
  /// In en, this message translates to:
  /// **'Specialists'**
  String get specialists;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @posts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get posts;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// No description provided for @specialSaleAlert.
  ///
  /// In en, this message translates to:
  /// **'Special Sale Alert!'**
  String get specialSaleAlert;

  /// No description provided for @saleDescription.
  ///
  /// In en, this message translates to:
  /// **'Up to 70% off on selected farming equipment'**
  String get saleDescription;

  /// No description provided for @newFollower.
  ///
  /// In en, this message translates to:
  /// **'New Follower'**
  String get newFollower;

  /// No description provided for @followerDescription.
  ///
  /// In en, this message translates to:
  /// **'started following you'**
  String get followerDescription;

  /// No description provided for @postLiked.
  ///
  /// In en, this message translates to:
  /// **'Post Liked'**
  String get postLiked;

  /// No description provided for @likeDescription.
  ///
  /// In en, this message translates to:
  /// **'Your post about organic farming got 15 likes'**
  String get likeDescription;

  /// No description provided for @newComment.
  ///
  /// In en, this message translates to:
  /// **'New Comment'**
  String get newComment;

  /// No description provided for @commentDescription.
  ///
  /// In en, this message translates to:
  /// **'commented on your farming tips post'**
  String get commentDescription;

  /// No description provided for @postShared.
  ///
  /// In en, this message translates to:
  /// **'Post Shared'**
  String get postShared;

  /// No description provided for @shareDescription.
  ///
  /// In en, this message translates to:
  /// **'Your irrigation system post was shared'**
  String get shareDescription;

  /// No description provided for @achievementUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Achievement Unlocked'**
  String get achievementUnlocked;

  /// No description provided for @achievementDescription.
  ///
  /// In en, this message translates to:
  /// **'You earned the \"Expert Farmer\" badge'**
  String get achievementDescription;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'hours ago'**
  String get hoursAgo;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'days ago'**
  String get daysAgo;

  /// No description provided for @dayAgo.
  ///
  /// In en, this message translates to:
  /// **'day ago'**
  String get dayAgo;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get justNow;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @kurdish.
  ///
  /// In en, this message translates to:
  /// **'کوردی سۆرانی'**
  String get kurdish;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language changed successfully'**
  String get languageChanged;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @enterTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your post title...'**
  String get enterTitle;

  /// No description provided for @shareKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Share your farming knowledge, tips, or ask questions...'**
  String get shareKnowledge;

  /// No description provided for @addTags.
  ///
  /// In en, this message translates to:
  /// **'Add tags separated by commas (e.g., farming, tips, organic)'**
  String get addTags;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in title and content'**
  String get fillAllFields;

  /// No description provided for @postCreated.
  ///
  /// In en, this message translates to:
  /// **'Post created successfully!'**
  String get postCreated;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLess;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// No description provided for @readLess.
  ///
  /// In en, this message translates to:
  /// **'Read Less'**
  String get readLess;

  /// No description provided for @connectingFarmers.
  ///
  /// In en, this message translates to:
  /// **'Empowering Farmers of Kurdistan'**
  String get connectingFarmers;

  /// No description provided for @agriculturalExperts.
  ///
  /// In en, this message translates to:
  /// **'Agricultural Experts'**
  String get agriculturalExperts;

  /// No description provided for @johnFarmer.
  ///
  /// In en, this message translates to:
  /// **'John Farmer'**
  String get johnFarmer;

  /// No description provided for @johnFarmerEmail.
  ///
  /// In en, this message translates to:
  /// **'john.farmer@example.com'**
  String get johnFarmerEmail;

  /// No description provided for @calendarFeature.
  ///
  /// In en, this message translates to:
  /// **'Calendar feature coming soon!'**
  String get calendarFeature;

  /// No description provided for @educationFeature.
  ///
  /// In en, this message translates to:
  /// **'Education feature coming soon!'**
  String get educationFeature;

  /// No description provided for @feedbackFeature.
  ///
  /// In en, this message translates to:
  /// **'Feedback feature coming soon!'**
  String get feedbackFeature;

  /// No description provided for @noRouteDefined.
  ///
  /// In en, this message translates to:
  /// **'No route defined for'**
  String get noRouteDefined;

  /// No description provided for @welcomeSelectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeSelectLanguage;

  /// No description provided for @pleaseSelectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Please Select Your Language'**
  String get pleaseSelectLanguage;

  /// No description provided for @loginText.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get loginText;

  /// No description provided for @signUpText.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get signUpText;

  /// No description provided for @signInWithText.
  ///
  /// In en, this message translates to:
  /// **'Sign in with'**
  String get signInWithText;

  /// No description provided for @signUpWithText.
  ///
  /// In en, this message translates to:
  /// **'Sign up with'**
  String get signUpWithText;

  /// No description provided for @verificationCodeText.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCodeText;

  /// No description provided for @pleaseTypeCodeText.
  ///
  /// In en, this message translates to:
  /// **'Please type the verification code sent to\ntrytempii@gmail.com'**
  String get pleaseTypeCodeText;

  /// No description provided for @registrationText.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registrationText;

  /// No description provided for @enterPhoneToVerifyText.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to verify\nyour account'**
  String get enterPhoneToVerifyText;

  /// No description provided for @sendText.
  ///
  /// In en, this message translates to:
  /// **'SEND'**
  String get sendText;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpTitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullNameLabel;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @signUpButton.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get signUpButton;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get typeMessage;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @expertAdvise.
  ///
  /// In en, this message translates to:
  /// **'Expert Advise'**
  String get expertAdvise;

  /// No description provided for @onlineNow.
  ///
  /// In en, this message translates to:
  /// **'Online Now'**
  String get onlineNow;

  /// No description provided for @noExpertProvided.
  ///
  /// In en, this message translates to:
  /// **'No expert provided for chat'**
  String get noExpertProvided;

  /// No description provided for @farmerMarkets.
  ///
  /// In en, this message translates to:
  /// **'Farmer Markets'**
  String get farmerMarkets;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No Products Found'**
  String get noProductsFound;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'minutes ago'**
  String get minutesAgo;

  /// No description provided for @learnGrow.
  ///
  /// In en, this message translates to:
  /// **'Learn & Grow Together'**
  String get learnGrow;

  /// No description provided for @appTutorials.
  ///
  /// In en, this message translates to:
  /// **'App Tutorials'**
  String get appTutorials;

  /// No description provided for @farmingGuides.
  ///
  /// In en, this message translates to:
  /// **'Farming Guides'**
  String get farmingGuides;

  /// No description provided for @tutorialsAvailable.
  ///
  /// In en, this message translates to:
  /// **'tutorials available'**
  String get tutorialsAvailable;

  /// No description provided for @guidesAvailable.
  ///
  /// In en, this message translates to:
  /// **'guides available'**
  String get guidesAvailable;

  /// No description provided for @searchTutorials.
  ///
  /// In en, this message translates to:
  /// **'Search tutorials...'**
  String get searchTutorials;

  /// No description provided for @noTutorialsFound.
  ///
  /// In en, this message translates to:
  /// **'No tutorials found'**
  String get noTutorialsFound;

  /// No description provided for @noGuidesFound.
  ///
  /// In en, this message translates to:
  /// **'No guides found'**
  String get noGuidesFound;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @startTutorial.
  ///
  /// In en, this message translates to:
  /// **'Start Tutorial'**
  String get startTutorial;

  /// No description provided for @reviewTutorial.
  ///
  /// In en, this message translates to:
  /// **'Review Tutorial'**
  String get reviewTutorial;

  /// No description provided for @readGuide.
  ///
  /// In en, this message translates to:
  /// **'Read Guide'**
  String get readGuide;

  /// No description provided for @guideOverview.
  ///
  /// In en, this message translates to:
  /// **'Guide Overview'**
  String get guideOverview;

  /// No description provided for @aboutTutorial.
  ///
  /// In en, this message translates to:
  /// **'About this tutorial'**
  String get aboutTutorial;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @readers.
  ///
  /// In en, this message translates to:
  /// **'readers'**
  String get readers;

  /// No description provided for @appUsage.
  ///
  /// In en, this message translates to:
  /// **'App Usage'**
  String get appUsage;

  /// No description provided for @cropGuides.
  ///
  /// In en, this message translates to:
  /// **'Crop Guides'**
  String get cropGuides;

  /// No description provided for @seasonalTips.
  ///
  /// In en, this message translates to:
  /// **'Seasonal Tips'**
  String get seasonalTips;

  /// No description provided for @bestPractices.
  ///
  /// In en, this message translates to:
  /// **'Best Practices'**
  String get bestPractices;

  /// No description provided for @pestControl.
  ///
  /// In en, this message translates to:
  /// **'Pest Control'**
  String get pestControl;

  /// No description provided for @irrigation.
  ///
  /// In en, this message translates to:
  /// **'Irrigation'**
  String get irrigation;

  /// No description provided for @soilHealth.
  ///
  /// In en, this message translates to:
  /// **'Soil Health'**
  String get soilHealth;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get ongoing;

  /// No description provided for @seasonal.
  ///
  /// In en, this message translates to:
  /// **'Seasonal'**
  String get seasonal;

  /// No description provided for @setup.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get setup;

  /// No description provided for @welcomeToAgroLink.
  ///
  /// In en, this message translates to:
  /// **'Welcome to FarmLink'**
  String get welcomeToAgroLink;

  /// No description provided for @welcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn how to navigate the app and access all features'**
  String get welcomeDescription;

  /// No description provided for @findingExperts.
  ///
  /// In en, this message translates to:
  /// **'Finding Experts'**
  String get findingExperts;

  /// No description provided for @findingExpertsDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect with agricultural specialists in your area'**
  String get findingExpertsDescription;

  /// No description provided for @marketplaceGuide.
  ///
  /// In en, this message translates to:
  /// **'Marketplace Guide'**
  String get marketplaceGuide;

  /// No description provided for @marketplaceGuideDescription.
  ///
  /// In en, this message translates to:
  /// **'Buy and sell farming products and equipment'**
  String get marketplaceGuideDescription;

  /// No description provided for @aiAssistant.
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get aiAssistant;

  /// No description provided for @aiAssistantDescription.
  ///
  /// In en, this message translates to:
  /// **'Get instant answers to your farming questions'**
  String get aiAssistantDescription;

  /// No description provided for @creatingPosts.
  ///
  /// In en, this message translates to:
  /// **'Creating Posts'**
  String get creatingPosts;

  /// No description provided for @creatingPostsDescription.
  ///
  /// In en, this message translates to:
  /// **'Share your farming knowledge and experiences'**
  String get creatingPostsDescription;

  /// No description provided for @tomatoCultivationGuide.
  ///
  /// In en, this message translates to:
  /// **'Tomato Cultivation Guide'**
  String get tomatoCultivationGuide;

  /// No description provided for @tomatoCultivationDescription.
  ///
  /// In en, this message translates to:
  /// **'Complete guide from seedling to harvest'**
  String get tomatoCultivationDescription;

  /// No description provided for @wheatFarmingBestPractices.
  ///
  /// In en, this message translates to:
  /// **'Wheat Farming Best Practices'**
  String get wheatFarmingBestPractices;

  /// No description provided for @wheatFarmingDescription.
  ///
  /// In en, this message translates to:
  /// **'Modern techniques for maximum yield'**
  String get wheatFarmingDescription;

  /// No description provided for @dripIrrigationSystems.
  ///
  /// In en, this message translates to:
  /// **'Drip Irrigation Systems'**
  String get dripIrrigationSystems;

  /// No description provided for @dripIrrigationDescription.
  ///
  /// In en, this message translates to:
  /// **'Save water and improve crop quality'**
  String get dripIrrigationDescription;

  /// No description provided for @rainwaterHarvesting.
  ///
  /// In en, this message translates to:
  /// **'Rainwater Harvesting'**
  String get rainwaterHarvesting;

  /// No description provided for @rainwaterHarvestingDescription.
  ///
  /// In en, this message translates to:
  /// **'Sustainable water collection methods'**
  String get rainwaterHarvestingDescription;

  /// No description provided for @organicPestManagement.
  ///
  /// In en, this message translates to:
  /// **'Organic Pest Management'**
  String get organicPestManagement;

  /// No description provided for @organicPestManagementDescription.
  ///
  /// In en, this message translates to:
  /// **'Natural solutions for common pests'**
  String get organicPestManagementDescription;

  /// No description provided for @soilHealthFertilization.
  ///
  /// In en, this message translates to:
  /// **'Soil Health & Fertilization'**
  String get soilHealthFertilization;

  /// No description provided for @soilHealthDescription.
  ///
  /// In en, this message translates to:
  /// **'Building and maintaining fertile soil'**
  String get soilHealthDescription;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allCategories;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'ku'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'ku': return AppLocalizationsKu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
