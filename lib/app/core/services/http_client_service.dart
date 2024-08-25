import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/pop_ups/toast_component.dart';
import 'package:loogisti/app/core/constants/end_points_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/data/models/api_response.dart';
import 'package:loogisti/app/modules/user_controller.dart';

class HttpClientService {
  static final String _baseUrl = Uri.encodeFull(EndPointsConstants.baseUrl);

  static Future<ApiResponse?> sendRequest({
    required String endPoint,
    required HttpRequestTypes requestType,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? header,
    Function? onLoading,
    Function(ApiResponse response)? onSuccess,
    Function(List<String> errorsList, ApiResponse response)? onError,
    Function? onFinal,
    Function(int sent, int total)? onProgress,
    bool? showErrorToast = true,
  }) async {
    ApiResponse? response;
    if (onLoading != null) onLoading();
    try {
      if (requestType == HttpRequestTypes.post) {
        response = await post(endPoint,
            formData: data, header: header, onProgress: onProgress);
      } else if (requestType == HttpRequestTypes.get) {
        response = await get(
          endPoint,
          queryParameters: queryParameters,
          header: header,
          data: data,
        );
      } else if (requestType == HttpRequestTypes.delete) {
        response = await delete(endPoint, formData: data, header: header);
      } else if (requestType == HttpRequestTypes.put) {
        response = await put(endPoint, formData: data, header: header);
      } else if (requestType == HttpRequestTypes.patch) {
        response = await patch(endPoint, formData: data, header: header);
      }

      log('endpoint::::${endPoint} status code::::${response?.statusCode} sent data::: ${data} query::::${queryParameters} response::: ${response?.message}  body:::: ${response?.body}');
      if ((response?.statusCode == 200)) {
        if (onSuccess != null) onSuccess(response!);
        return response;
      } else {
        if (response?.requestStatus == RequestStatus.serverError) {
          if (showErrorToast != false) {
            ToastComponent.showErrorToast(Get.context!,
                text: StringsAssetsConstants.serverErrorMessage);
          }
          print('ok');
        } else if (response?.requestStatus == RequestStatus.clientError) {
          if (response?.statusCode == 401) {
            ToastComponent.showErrorToast(Get.context!,
                text: StringsAssetsConstants.sessionExpired);
            Get.find<UserController>().clearUser(withoutLogout: true);
          } else {
            if (showErrorToast != false) {
              ToastComponent.showErrorToast(Get.context!,
                  text: response?.message);
            }
          }
        } else {
          if (showErrorToast != false) {
            ToastComponent.showErrorToast(Get.context!,
                text: StringsAssetsConstants.internetErrorMessage);
          }
        }
        if (onError != null)
          onError(convertResponseErrorsToString(response!), response);
      }
    } catch (error) {
      if (showErrorToast != false) {
        ToastComponent.showErrorToast(Get.context!,
            text: StringsAssetsConstants.internetErrorMessage);
      }
    } finally {
      if (onFinal != null) onFinal();
    }
  }

  static Future<dio.BaseOptions> getBaseOptions(
      {Map<String, String?>? header, int? timeout}) async {
    header ??= <String, String?>{};
    header.addAll({
      "Accept": "application/json",
      "Content-type": "application/json",
      "Accept-Language": Get.locale?.languageCode,
      "Authorization":
          "Bearer ${await LocalStorageService.loadData(key: StorageKeysConstants.serverApiToken, type: DataTypes.string)}"
    });
    return dio.BaseOptions(
      baseUrl: Uri.encodeFull(_baseUrl),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: header,
    );
  }

  static Future<ApiResponse> get(String endPoint,
      {int? timeout,
      Map<String, String>? header,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(timeout: timeout, header: header),
      ).get(
        Uri.encodeFull(endPoint),
        queryParameters: queryParameters,
        data: data,
      );
      return _buildOut(response);
    } catch (_error) {
      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        return _errorNoResponse(error);
      } else {
        return _buildOut(error.response!);
      }
    }
  }

  static Future<ApiResponse> post(String endPoint,
      {dynamic formData,
      Map<String, String?>? header,
      int? timeout,
      Map<String, String?>? queryParameters,
      Function(int sent, int total)? onProgress}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(
          timeout: timeout,
          header: header,
        ),
      ).post(
        Uri.encodeFull(endPoint),
        data: formData,
        queryParameters: queryParameters,
        onSendProgress: onProgress,
      );
      return _buildOut(response);
    } catch (_error) {
      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        return _errorNoResponse(error);
      } else {
        return _buildOut(error.response!);
      }
    }
  }

  static Future<ApiResponse> delete(String endPoint,
      {dynamic formData,
      Map<String, String>? header,
      int? timeout,
      Map<String, String>? queryParameters}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(
          timeout: timeout,
          header: header,
        ),
      ).delete(
        Uri.encodeFull(endPoint),
        data: formData,
        queryParameters: queryParameters,
      );
      return _buildOut(response);
    } catch (_error) {
      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        return _errorNoResponse(error);
      } else {
        return _buildOut(error.response!);
      }
    }
  }

  static Future<ApiResponse> put(String endPoint,
      {dynamic formData,
      Map<String, String>? header,
      int? timeout,
      Map<String, String>? queryParameters}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(
          timeout: timeout,
          header: header,
        ),
      ).put(
        Uri.encodeFull(endPoint),
        data: formData,
        queryParameters: queryParameters,
      );
      return _buildOut(response);
    } catch (_error) {
      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        return _errorNoResponse(error);
      } else {
        return _buildOut(error.response!);
      }
    }
  }

  static Future<ApiResponse> patch(String endPoint,
      {dynamic formData,
      Map<String, String>? header,
      int? timeout,
      Map<String, String>? queryParameters}) async {
    try {
      dio.Response response = await dio.Dio(
        await getBaseOptions(
          timeout: timeout,
          header: header,
        ),
      ).patch(
        Uri.encodeFull(endPoint),
        data: formData,
        queryParameters: queryParameters,
      );
      return _buildOut(response);
    } catch (_error) {
      dio.DioError error = _error as dio.DioError;
      if (error.response == null) {
        return _errorNoResponse(error);
      } else {
        return _buildOut(error.response!);
      }
    }
  }

  static ApiResponse _buildOut(dio.Response response) {
    print(
        'status code::: ${response.statusCode}, message: ${response.data['message']}');

    ApiResponse apiResponse = ApiResponse();
    if (response.statusCode == 200) {
      apiResponse.statusCode = response.statusCode;
      apiResponse.message = response.data['message'];
      apiResponse.body = response.data['result'];
      apiResponse.requestStatus = RequestStatus.success;
    } else if ((response.statusCode ?? -0) >= 201 &&
        (response.statusCode ?? -0) < 500) {
      apiResponse.statusCode = response.statusCode;
      apiResponse.message = response.data['message'];
      apiResponse.error = response.data['errors'];
      apiResponse.requestStatus = RequestStatus.clientError;
    } else if ((response.statusCode ?? -0) >= 500 &&
        (response.statusCode ?? -0) < 600) {
      apiResponse.statusCode = response.statusCode;
      apiResponse.message = response.data['message'];
      apiResponse.error = response.data['errors'];
      apiResponse.requestStatus = RequestStatus.serverError;
    }
    return apiResponse;
  }

  static ApiResponse _errorNoResponse(dio.DioError error) {
    if (error.error is SocketException) {
      return ApiResponse(
          statusCode: 502, requestStatus: RequestStatus.internetError);
    } else if (error is TimeoutException) {
      return ApiResponse(
          statusCode: 504, requestStatus: RequestStatus.internetError);
    } else {
      return ApiResponse(
          statusCode: 500, requestStatus: RequestStatus.serverError);
    }
  }

  static List<String> convertResponseErrorsToString(ApiResponse response) {
    List<String> errorsMessage = [];
    Map<String, dynamic> messagesList = response.error;
    messagesList.forEach((key, value) {
      if (value is List) {
        for (var item in value) {
          errorsMessage.add(item);
        }
      } else {
        errorsMessage.add(value);
      }
    });
    return errorsMessage;
  }
}

enum HttpRequestTypes {
  post,
  delete,
  put,
  get,
  patch,
}
