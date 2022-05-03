import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile/constants/end_points.dart';
import 'package:mobile/data/network/responses/successful_response.dart';
import 'package:mobile/data/remote/dio_helper.dart';
import 'package:mobile/presentation/widgets/toast.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  static VerifyCubit get(context) => BlocProvider.of(context);

  SuccessfulResponse? successfulResponse;

  Future verifyCode({
    required String email,
    required String code,
  }) async {
    await DioHelper.postData(
      url: verify,
      body: {
        'email': email,
        'code': code,
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
