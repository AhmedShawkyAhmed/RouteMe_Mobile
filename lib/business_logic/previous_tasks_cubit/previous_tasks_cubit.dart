import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/data/models/get_driver_tasks_model.dart';
import 'package:mobile/data/network/responses/get_driver_tasks_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';
import 'package:mobile/presentation/widgets/toast.dart';

part 'previous_tasks_state.dart';

class PreviousTasksCubit extends Cubit<List<MyTasksModel>> {
  PreviousTasksCubit() : super([]);

  static PreviousTasksCubit get(context) => BlocProvider.of(context);

  MyTasksResponse? previousTasksResponse;

  Future getDriverTasks() async {
    await DioHelper.postData(
      url: getPreviousTasks,
      body: {
        'driverId': CacheHelper.getDataFromSharedPreference(key: "userId"),
      },
    ).then((value) {
      //print(value.data);
      final myData = Map<String, dynamic>.from(value.data);
      previousTasksResponse = MyTasksResponse.fromJson(myData);
      if (previousTasksResponse!.status == 200) {
        return previousTasksResponse!.tasks;
      } else {
        showToast(previousTasksResponse!.message);
        return previousTasksResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return previousTasksResponse!.tasks;
  }
  void get myTasks async => emit(await getDriverTasks());
}
