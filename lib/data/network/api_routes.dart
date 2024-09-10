class ApiRoutes {
  static const String devUrl = "http://54.224.210.106:9090/";
  static const String preprodUrl = "";
  static const String prodUrl = "";

  static String sendOtp(data) => "vendor/send/otp/$data";
  static const validateOtp = "vendor/send/otp/";
  static const register = "vendor/new/registration";
  static const updateAddress = "vendor/update/address";
  static String checkMobileNumber(data) => "validate/mobile/$data";
  static const addGalleryImages = "shop/gallery/upload/images";
  static const addGalleryVideos = "shop/gallery/upload/videos";
  static const addCategory = "listing-service/add/category";
  static String addServiceToCategory(data) =>
      "listing-service/add-service/$data";
  static String addSubServiceToServiceInCategory(data) =>
      "listing-service/add-sub/category/$data";
  static String showDataOfCategory(data) => "listing-service/category/$data";
  static String vendorLogin (data)  => "vendor/login/withEmailAndPassword/$data/$data";
}
