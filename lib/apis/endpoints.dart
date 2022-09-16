// ignore_for_file: constant_identifier_names

abstract class Endpoints {
  Endpoints._();
  static const SERVICEMAN_LOGIN = "serviceman/login";
  static const WORK_LOGIN = "serviceman/worklogin";
  static const VALIDATE_OTP = "validateOTP";
  static const ALL_BANNERS = "banners";
  static const ALL_CATEGORIES = "categories";
  static const SUBCATEGORY_BY_ID = "subcategory/";
  static const SERVICE_BY_ID = "service/";
  static const POPULAR_SERVICES = "popular_services";
  static const SEARCH_PRODUCTS = "services";
  static const ADD_ADDRESS = "address";
  static const UPDATE_ADDRESS = "address";
  static const USER_BY_PHONENUMBER = "user";
  static const UPDATE_USER = "user";
  static const ADD_ORDER = "order";
  static const DELETE_ORDER = "order";
  static const ORDER_BY_USER_ID = "order/user/";
  static const FIND_SERVICEMAN = "findServiceman";
  static const ORDER_BY_ID = "order";
  static const SWITCH_ISWORKING = "serviceman/switchIsWorking";
}

abstract class BaseUrls {
  BaseUrls._();
  static const FLASK_URL = 'https://fixpals-public-backend.herokuapp.com';
  static const NODE_URL = 'https://fixpals-backend.herokuapp.com';
}
