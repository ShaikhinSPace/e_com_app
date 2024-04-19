import 'package:e_com_app/features/api/api.dart';
import 'package:e_com_app/features/api/blo/api_event.dart';
import 'package:e_com_app/features/api/blo/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final ApiService apiService;
  ApiBloc(this.apiService) : super(ApiInitial()) {
    @override
    Stream<ApiState> mapEventtoState(ApiEvent event) async* {
      if (event is FetchData) {
        yield ApiLoading();
        try {
          final data = await apiService.fetchData();
          yield ApiLoaded(data);
        } catch (e) {
          yield ApiError('Failed to Fetch Data : $e');
        }
      }
    }
  }
}
