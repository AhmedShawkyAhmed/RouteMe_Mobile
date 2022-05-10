import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/network/responses/successful_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';
import 'package:mobile/presentation/widgets/toast.dart';

part 'finish_task_state.dart';

class FinishTaskCubit extends Cubit<FinishTaskState> {
  FinishTaskCubit() : super(FinishTaskInitial());

  static FinishTaskCubit get(context) => BlocProvider.of(context);

  SuccessfulResponse? successfulResponse;

  Future finishTask({
    required String taskId,
    required String orderId,
    required String status,
    required String state,
    required String comment,
  }) async {
    await DioHelper.postData(
      url: taskStatus,
      body: {
        'taskId': taskId,
        'orderId': orderId,
        'status': status,
        'state': state,
        'comment': comment,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      successfulResponse = SuccessfulResponse.fromJson(myData);
      showToast(successfulResponse!.message);
    }).catchError((error) {
      //showToast(error.toString());
    });
    return successfulResponse!.message;
  }
}
