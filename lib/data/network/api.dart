import 'package:dio/dio.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/data/responses/responses.dart';
import 'package:retrofit/retrofit.dart';
part 'api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ApiServiceClient {
  factory ApiServiceClient(Dio dio, {String baseUrl}) = _ApiServiceClient;

  @POST("/api/v1/tenancy/login")
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @POST("/api/v1/tenancy/otpservice")
  Future<GeneralSuccessResponse> otpservice(@Body() Map<String, dynamic> body);

  @GET("/api/v1/tenancy/otpservice")
  Future<GeneralSuccessResponse> otpserviceGet();

  @POST("/api/v1/tenancy/signup")
  Future<GeneralSuccessResponse> signup(@Body() Map<String, dynamic> body);

  @GET("/api/v1/tenancy/checkdomainavail")
  Future<GeneralSuccessResponse> checkdomainavailiability(
      @Queries() Map<String, String> queryParams);

  @POST("/api/v1/tenancy/forgotpassword")
  Future<GeneralSuccessResponse> forgotpassword(
      @Body() Map<String, dynamic> body);
}
