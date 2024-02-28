class Strings {
  // Error messages
  static const String errorApiRequest = 'Error during API request';
  static const String errorInvalidCredentials = 'Invalid username or password';

  // API Endpoints
  static const String baseUrl = 'https://aoc.astina.co.id:8444';
  static const String loginEndpoint = '/api/v1/auth/tokens';
  static const String profileEndpoint = '/api/v1/models/HR_EmployeeM/';
  static const String companyProfileEndpoint = '/api/v1/models/AD_ClientInfo';
  static const String postImagesEndpoint = '/api/v1/models/AD_Image';
  static const String activitiesEndpoint = '/api/v1/models/HR_FingerprintM';
  static const String workingLocationsEndpoint = '/api/v1/models/HR_Location';
  static const String postAttendanceEndpoint = '/api/v1/models/HR_FingerprintM';
}
