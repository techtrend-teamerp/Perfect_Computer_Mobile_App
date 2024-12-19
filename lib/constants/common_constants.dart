import 'package:flutter/material.dart';
import 'package:perfect_computer/utils/helpers/material_color_generator.dart';

class CommonConstants {
  static const kPrimaryColor = Color(0xFF6747AF);
  static const kPrimaryLightColor = Color(0xFFF1ECFC);
  static const kSecondaryColor = Color(0xFF2BCDD0);

  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 14.0;

  static const Duration connectionTimeOutDuration =
      Duration(milliseconds: 180000);

  static const Duration receiveTimeOutDuration = Duration(milliseconds: 180000);

  static const Duration errorDuration = Duration(milliseconds: 1000);

  static const Duration errorLongTimeOut = Duration(milliseconds: 3000);

  static MaterialColor primaryColor =
      MaterialColorGenerator.generateMaterialColor(
    color: const Color(0xFF6747AF),
  );

  // TODO Dashboard Constant
  static const int currentWeek = 1;
  static const int lastWeek = 2;
  static const int month = 3;
  static const int year = 4;
  static const int lifeTime = 5;
  static const int custom = 6;

  // TODO For Given Received
  static const int given = 1;
  static const int received = 2;

  //TODO DashboardTabType
  static const int currentWeekTab = 0;
  static const int lastWeekTab = 1;
  static const int monthTab = 2;

  //TODO for device type
  static const int ios = 1;
  static const int android = 2;

  //TODO Activity Type
  static const int h2h = 1;
  static const int business = 2;
  static const int testimonial = 3;
  static const int referral = 4;

  //TODO For Video and Image Upload Size
  static const int capturedImageQuality = 60;
  static const int pickedImageQuality = 70;

  static const double imageUploadSizeInMb = 10;
  static const double videoUploadSizeInMb = 15;
  static const double pdfUploadSizeInMb = 5;

  static const String regular = "Poppins";
  static const String bold = "proxima_nova_bold";
  static const String thin = "proxima_nova_thin";

  static const String feedImageUploadFolderName = "FeedImage";
  static const String feedVideoUploadFolderName = "FeedVideos";
  static const String profileImageAndBannerFolderName = "ProfileImage";
  static const String elevatorSpeechVideoUploadFolderName = "ProfileElevator";

  //TODO Post Type
  static const int userPostType = 1;
  static const int specificAskPostType = 2;

  //TODO H2h
  static const String mySelf = "My Self";
  static const String selectMember = "Select Member";

  //TODO Inviting Visitor
  static const String selectProfession = "Select Profession";

  //TODO Specific Ask Type
  static const int allSpecificAsk = 0;
  static const int mySpecificAsk = 1;

  //TODO Specific Ask label type
  static const int specificAskId = 1;
  static const int offeringId = 2;
  static const int generalAskId = 3;

  static const int happyToHelpBtnType = 1;
  static const int interestedMoreBtnType = 2;
  static const int iCanConnectBtnType = 3;

//TODO Insert Testimonial
  static const String directoryToSave = "Pdf";

  //TODO Performance Tab Number
  static const int referenceGiver = 1;
  static const int specificAskFullFilled = 2;
  static const int thankYouNoteReceiver = 3;

  //TODO Create Support Request
  static const String bug = "Bug";
  static const String iosApplication = "Ios Application";
  static const String androidApplication = "Android Application";
  static const String web = "Web";

  //TODO User Role
  static const String userRoleAdmin = "Admin";
  static const String userRoleMember = "Member";
  static const String userRoleCountryAmbassador = "CountryAmbassador";
  static const String userRoleRegionAmbassador = "RegionAmbassador";
  static const String userRoleCityAmbassador = "CityAmbassador";
  static const String userRoleChapterCoordinator = "ChapterCoordinator";
  static const String userRolePresident = "President";
  static const String userRoleVP = "VP";
  static const String userRoleSecretary = "Secretary";
  static const String userRoleVHL = "VHL";
  static const String userRoleTeamView = "TeamView";
  static const String userRoleOfficeAdmin = "OfficeAdmin";
  static const String userRoleMC = "MC";
}
