import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/data/models/get_driver_tasks_model.dart';
import 'package:mobile/data/network/responses/get_driver_tasks_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';
import 'package:mobile/presentation/widgets/toast.dart';

part 'driver_tasks_state.dart';

class DriverTasksCubit extends Cubit<List<MyTasksModel>> {
  
  DriverTasksCubit() : super([]);

  static DriverTasksCubit get(context) => BlocProvider.of(context);

  MyTasksResponse? myTasksResponse;

  Future getDriverTasks() async {
    await DioHelper.postData(
      url: tasks,
      body: {
        'driverId': CacheHelper.getDataFromSharedPreference(key: "userId"),
      },
    ).then((value) {
      //print(value.data);
      final myData = Map<String, dynamic>.from(value.data);
      myTasksResponse = MyTasksResponse.fromJson(myData);
      if (myTasksResponse!.status == 200) {
        return myTasksResponse!.tasks;
      } else {
        showToast(myTasksResponse!.message);
        return myTasksResponse!.message;
      }
    }).catchError((error) {
      showToast(error.toString());
    });
    return myTasksResponse!.tasks;
  }
  void get myTasks async => emit(await getDriverTasks());
}
