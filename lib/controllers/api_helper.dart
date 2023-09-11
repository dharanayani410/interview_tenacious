import 'package:http/http.dart';

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();

  Future<List?> fetchData() async {
    String api =
        "https://www.foodchow.com/api/FoodChowWD/AllRestaurantsWDOfferApp?Country=India&city=Surat&area=&longitude=&latitude=&deliveryMethod=&cuisineId=2,1&clientid=&startlimit=0&endlimit=1000&onoffflag";
    Response response = await get(Uri.parse(api));

    if (response.statusCode == 200) {
      List apiData = [];
      // Map data = jsonDecode(response.body);
      print(response.runtimeType);
      print(response.statusCode);

      apiData.add(response.body);

      print(apiData);

      return apiData;
    }
    return null;
  }
}
