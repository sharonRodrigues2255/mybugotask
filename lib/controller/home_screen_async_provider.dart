import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/workshop_model.dart';

class HomeScreenAsyncProvider extends ChangeNotifier {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://api.myburgo.com/home/workshop/filter"),
  );

  List<Workshop>? challenges;
  List<Workshop>? recordedVideos;
  List<Workshop>? liveWorkshops;
  bool isLoading = false;
  String errorMessage = "";
  resetError() {
    errorMessage = "";
  }

 Future<void> refresh()async {
    if (challenges == null) {
      fetchChallenges();
    }
    if (recordedVideos == null) {
      fetchRecordedVideos();
    }
    if (liveWorkshops == null) {
      fetchLiveWorkshops();
    }
  }

  Future<void> fetchChallenges() async {
    _setLoading(true);
    try {
      final response = await dio.get("?tags=Challenges");
      log(response.data.toString());
      challenges =
          (response.data['data'] as List).map((e) => Workshop.fromJson(e)).toList();
    } on DioException catch (e) {
      errorMessage = _handleDioError(e);
    } catch (e) {
      errorMessage = "Unexpected error occurred: $e";
    }
    _setLoading(false);
  }

  Future<void> fetchRecordedVideos() async {
    _setLoading(true);
    try {
      final response = await dio.get("?type=2");
      log(response.data.toString());

      recordedVideos =
          (response.data['data'] as List).map((e) => Workshop.fromJson(e)).toList();
    } on DioException catch (e) {
      errorMessage = _handleDioError(e);
    } catch (e) {
      errorMessage = "Unexpected error occurred: $e";
    }
    _setLoading(false);
  }

  Future<void> fetchLiveWorkshops() async {
    _setLoading(true);
    try {
      final response = await dio.get("?type=1");
      log(response.data.toString());

      liveWorkshops =
          (response.data['data'] as List).map((e) => Workshop.fromJson(e)).toList();
    } on DioException catch (e) {
      errorMessage = _handleDioError(e);
    } catch (e) {
      errorMessage = "Unexpected error occurred: $e";
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    if (value == true) {
      errorMessage = '';
    }
    isLoading = value;
    notifyListeners();
  }

  String _handleDioError(DioException e) {
    if (e.response != null) {
      return "Error ${e.response?.statusCode}: ${e.response?.statusMessage}";
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection timeout. Please try again.";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Server took too long to respond.";
    } else if (e.type == DioExceptionType.badResponse) {
      return "Invalid response from server.";
    } else {
      return "Network error. Please check your connection.";
    }
  }
}
