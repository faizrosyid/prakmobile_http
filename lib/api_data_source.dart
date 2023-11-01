import 'base_network.dart';

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork.get("users");
  }

  Future<Map<String, dynamic>> loadDetailUser(int idMasuk){
    String id = idMasuk.toString();
    return BaseNetwork.get("users/$id");
  }
}