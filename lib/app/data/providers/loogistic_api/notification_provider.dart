import 'package:loogisti/app/core/constants/end_points_constants.dart';
import 'package:loogisti/app/core/services/http_client_service.dart';
import 'package:loogisti/app/data/models/api_response.dart';
import 'package:loogisti/app/data/models/notification_model.dart';
import 'package:loogisti/app/data/models/pagination_model.dart';

class NotificationProvider {
  Future<PaginationModel<NotificationModel>?> getNotifications({
    required int page,
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.getNotifications,
      requestType: HttpRequestTypes.get,
      queryParameters: {
        'page': page,
      },
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );

    if (response?.body != null) {
      if (response?.body['notifications'] != null) {
        return PaginationModel.fromJson(response?.body['notifications'], NotificationModel.fromJson);
      }
    }
    return null;
  }
}
