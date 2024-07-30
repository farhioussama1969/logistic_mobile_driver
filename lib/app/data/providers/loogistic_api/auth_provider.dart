import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio;

import 'package:loogisti/app/core/constants/end_points_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/services/http_client_service.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/data/models/api_response.dart';
import 'package:loogisti/app/data/models/user_model.dart';

class AuthProvider {
  Future<UserModel?> socialLogin({
    required String? firebaseAuthToken,
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.socialSignIn,
      requestType: HttpRequestTypes.post,
      data: {
        "token": firebaseAuthToken,
        "fcm": await LocalStorageService.loadData(key: StorageKeysConstants.fcmToken, type: DataTypes.string),
      },
      onSuccess: (response) async {
        if (response.body['token'] != null) {
          await LocalStorageService.saveData(
              key: StorageKeysConstants.serverApiToken, value: response.body['token'], type: DataTypes.string);
        }
      },
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return UserModel.fromJson(response?.body['user']);
    }
    return null;
  }

  Future<UserModel?> getUserData({
    Function? onLoading,
    Function? onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.getUserData,
      requestType: HttpRequestTypes.get,
      onLoading: () {
        if (onLoading != null) onLoading();
      },
      onFinal: () {
        if (onFinal != null) onFinal();
      },
    );
    if (response?.body != null) {
      if (response?.body?['user'] != null) {
        return UserModel.fromJson(response?.body?['user']);
      }
    }
    return null;
  }

  Future<UserModel?> updateUserData({
    required String fullName,
    required String phoneNumber,
    String? carType,
    String? licenseExpiryDate,
    String? blackCard,
    String? registerNumber,
    String? nextInspectionDate,
    String? insuranceExpiryDate,
    File? avatarFile,
    String? fireExtinguisherExpiryDate,
    Function? onLoading,
    Function? onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.updateUserData,
      requestType: HttpRequestTypes.post,
      data: dio.FormData.fromMap({
        "fullname": fullName,
        "type_car": carType,
        "license_expiry_date": licenseExpiryDate,
        "black_card": blackCard,
        "register_number": registerNumber,
        "next_inspection_date": nextInspectionDate,
        "insurance_expiry_date": insuranceExpiryDate,
        "fire_extinguisher_expiry_date": fireExtinguisherExpiryDate,
        "phone": phoneNumber,
        if (avatarFile != null)
          "photo": avatarFile == null ? null : await dio.MultipartFile.fromFile(avatarFile.path, filename: avatarFile.path.split('/').last),
      }),
      onLoading: () {
        if (onLoading != null) onLoading();
      },
      onFinal: () {
        if (onFinal != null) onFinal();
      },
    );
    if (response?.body != null) {
      if (response?.body?['user'] != null) {
        return UserModel.fromJson(response?.body?['user']);
      }
    }
    return null;
  }

  Future<bool?> logout({
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.logout,
      requestType: HttpRequestTypes.get,
      showErrorToast: false,
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return response?.body['logout'];
    }
    return null;
  }

  Future<void> deleteAccount({
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.deleteAccount,
      requestType: HttpRequestTypes.get,
      showErrorToast: false,
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {}
    return null;
  }

  Future<bool?> changeDriverStatus({
    required Function onLoading,
    required Function onFinal,
  }) async {
    ApiResponse? response = await HttpClientService.sendRequest(
      endPoint: EndPointsConstants.changeStatus,
      requestType: HttpRequestTypes.get,
      showErrorToast: false,
      onLoading: () => onLoading(),
      onFinal: () => onFinal(),
    );
    if (response?.body != null) {
      return response?.body['activate'];
    }
    return null;
  }
}
