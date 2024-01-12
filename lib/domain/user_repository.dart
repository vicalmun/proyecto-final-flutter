abstract class UserRepository {
  Future getToken();
  Future<String> getTokenFromStorage();
  Future deleteTokemFromStorage();
}
