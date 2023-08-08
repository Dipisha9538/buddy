class ApiEndpoints {
  ApiEndpoints._();
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseURL = "http://10.0.2.2:3000/api/v1/";
  // static const String baseURL = "http://172.20.10.11:3000/api/v1/";
  // static const String baseURL = "http://localhost:3001/";
  static const String baseURL = "http://10.0.2.2:3001/";

  // Auth URL
  static const register = "users/register";
  static const login = "users/login";
  
  static const String getAllComments = "comments";
  static const String addComment = "comments";
  static const String deleteComment = "comments";

    // ====================== User Profile Routes ======================
  // static String getUserProfile(String userId) => "api/users/$userId";
  static const String profilePicture = "users/uploadProfilePicture";
  static const String getUser = "users/";
  static const String changePassword = "users/updatePassword";
  static const String editProfile = "users/editProfile";

    // ====================== Post Request Routes ======================
  static const String getAllBloods = "bloods/";
  static const String getBookmarkedBloods = "bloods/bookmarked-bloods";
  static const String getBloodById = "bloods/";
  static const String searchUserBlood = "bloods/searchUser?query=";
  static const String uploadImage = "users/uploadImage";
  static const String addBlood = "bloods/";
  static const String getAllUsers = "users/users";

  static String bookmarkBlood(String bloodId) => "bloods/bookmark/$bloodId";
  static String unbookmarkBlood(String bloodId) => "bloods/bookmark/$bloodId";
  static const String searchBloods = "bloods/search/";
  static const String bloodCover = "bloods/uploadBloodCover";

  static const String getUserBloods = "bloods/uploaded-by-current-user";

  static String updateBlood(String bloodId) => "bloods/$bloodId";
  static String deleteBlood(String bloodId) => "bloods/$bloodId";
}