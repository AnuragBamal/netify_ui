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
      @Queries() Map<String, dynamic> queryParams);

  @POST("/api/v1/tenancy/forgotpassword")
  Future<GeneralSuccessResponse> forgotpassword(
      @Body() Map<String, dynamic> body);

  @GET("/api/v1/tenancy/ui/userprofile")
  Future<GetUserResponse> getUserData();

  @GET("/api/v1/tenancy/ui/dashboard")
  Future<GetDashboardResponse> getDashboardData(
      @Queries() Map<String, dynamic> queryParams);

  @GET("/api/v1/tenancy/ui/userscreen")
  Future<GetUserListResponse> getUserListData(
      @Queries() Map<String, dynamic> queryParams);

  @GET("/api/v1/tenancy/ui/getresellermap")
  Future<GetResellerMapResponse> getResellerMap();

  @POST("/api/v1/tenancy/user")
  Future<GeneralSuccessResponse> createuser(@Body() Map<String, dynamic> body);

  @GET("/api/v1/tenancy/plans")
  Future<GetPlansResponse> getPlans();

  @POST("/api/v1/tenancy/plans")
  Future<GeneralSuccessResponse> createPlan(@Body() Map<String, dynamic> body);

  @GET("/api/v1/tenancy/operatorpricechart")
  Future<GetOperatorPriceChartResponse> getOperatorPriceChart();

  @POST("/api/v1/tenancy/operatorpricechart")
  Future<GeneralSuccessResponse> createOperatorPriceChart(
      @Body() Map<String, dynamic> body);

  @GET("/api/v1/tenancy/resellerpricechart")
  Future<GetResellerPriceChartResponse> getResellerPriceChart();

  @POST("/api/v1/tenancy/resellerpricechart")
  Future<GeneralSuccessResponse> createResellerPriceChart(
      @Body() Map<String, dynamic> body);

  @GET("/api/v1/tenancy/ui/getplanprofile")
  Future<GetPlanProfileMetaResponse> getPlanProfile();
}
