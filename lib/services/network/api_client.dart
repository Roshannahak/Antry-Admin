import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://localhost:5252")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  static ApiClient getServices() {
    final dio = Dio();
    return ApiClient(dio);
  }

  //STUDENT API
  //.
  @GET("/api/student")
  Future<String> getAllStudentApi();

  @DELETE("/api/student/{studentid}")
  Future<String> deleteStudentApi(@Path("studentid") String studentId);

  //VISITOR API
  //.
  @GET("/api/visitor")
  Future<String> getAllVisitor();

  @DELETE("/api/visitor/{visitorid}")
  Future<String> deleteVisitorApi(@Path("visitorid") String visitorId);

  //ADMIN API
  //.
  @GET("/api/admin")
  Future<String> getAllAdminApi();

  @POST("/api/auth/admin/register")
  Future<String> addAdminApi(@Body() Map<String, dynamic> body);

  //ROOM API
  //.
  @GET("/api/room")
  Future<String> getAllRoomsApi();

  @POST("/api/room")
  Future<String> addRoomApi(@Body() Map<String, dynamic> body);

  @DELETE("/api/room/{roomid}")
  Future<String> deleteRoomApi(@Path("roomid") String roomId);

  @PUT("/api/room/{roomid}")
  Future<String> updateRoomApi(
      @Path("roomId") String roomId, @Body() Map<String, dynamic> body);
}
