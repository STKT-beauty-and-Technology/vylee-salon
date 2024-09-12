class ApiRoutes {
  static const String devUrl = "http://54.224.210.106:9090/";
  static const String preprodUrl = "";
  static const String prodUrl = "";

  static String sendOtp(data) => "vendor/send/reset-otp/$data";
  static String validateOtp(email, otp, password) =>
      "vendor/validate/OTP/$email/$otp/$password";
  static const register = "vendor/new/registration";
  static String updateAddress(vendorId) => "vendor/update/address/$vendorId";
  static String checkMobileNumber(data) => "validate/mobile/$data";
  static String addGalleryImages(vendorId) =>
      "shop/gallery/upload/images";
  static String addGalleryVideos(vendorId) =>
      "shop/gallery/upload/videos";
  static String getAllCategories(vendorId) =>
      "listing-services/show/all/category/$vendorId";
  static String addCategory(vendorId) =>
      "listing-services/add-category/$vendorId";
  static String getCategoryData(category, vendorId) =>
      "listing-services/category/$category/$vendorId";
  static String addServiceToCategory(categoryId, vendorId) =>
      "listing-services/add-service/$categoryId/$vendorId";
  static String addSubCategoryToService(serviceId, vendorId) =>
      "listing-services/add-sub/category/$serviceId/$vendorId";
  static String vendorLogin(email, password) =>
      "vendor/login/withEmailAndPassword/$email/$password";
  static String salonInfo(vendorId , whatsappNumber , description , websiteName) =>
      "vendor/add/salon/information/$vendorId/$whatsappNumber/$description/$websiteName";
}
