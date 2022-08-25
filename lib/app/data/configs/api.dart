class Api {
  //* Creating instance constructor;
  static Api instance = Api();
  //* Base API URL

  static const domain = "http://172.20.10.2/ecobrickapi/public";

  // static const domain = "https://rini.lp2muniprima.ac.id";

  static const baseURL = "$domain/api";
  static const imageURL = "$domain/storage/photos/";

  String getUser = "$baseURL/user";
  String quizUrl = "$baseURL/quiz";
  String resultUrl = "$baseURL/result";
  String homeUrl = "$baseURL/home";
}
