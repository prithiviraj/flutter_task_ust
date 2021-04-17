class Constants {
  static String accessToken = "";
  static String currentUserID = "";

  static const baseURL = "https://dev4.careplaces.us/altaiscareplaces/api";
  static const APIVersion = "/v1";

  static const loginURL = "/login";
  static const getMessageURL = "/message/getUserMessages";
  static const getThreadMessages = "/message/getThreadMessages";
  static final sendMessage = "/message/sendMessage";

  static const isDebugShowCheckedModeBanner = false;

  static const connectTimeout = 6000;
  static const receiveTimeout = 3000;
}
