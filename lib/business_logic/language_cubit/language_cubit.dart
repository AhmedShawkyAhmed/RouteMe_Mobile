import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/main.dart';
import 'package:flutter/material.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  static LanguageCubit get(context) => BlocProvider.of(context);

  void onLanguageChange(){
    emit(LanguageLoadingState());
    if(CacheHelper.getDataFromSharedPreference(key: 'language') == "ar"){
      CacheHelper.saveDataSharedPreference(key: 'language', value: "en");
      delegate.changeLocale(const Locale("en"));
      emit(LanguageChangeState());
    }else{
      CacheHelper.saveDataSharedPreference(key: 'language', value: "ar");
      delegate.changeLocale(const Locale("ar"));
      emit(LanguageChangeState());
    }
    emit(LanguageSuccessState("ar"));
  }
}
