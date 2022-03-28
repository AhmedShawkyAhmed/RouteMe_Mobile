abstract class AppStates {}

class AppInitialState extends AppStates{}

class AppChangeBottomNavBarState extends AppStates{}

class AppChangeBottomSheetState extends AppStates{}

class AppGetBranchLodingState extends AppStates{}

class AppGetBranchSuccessState extends AppStates{}

class AppGetBranchErrorState extends AppStates{
  final String error;

  AppGetBranchErrorState(this.error);
}