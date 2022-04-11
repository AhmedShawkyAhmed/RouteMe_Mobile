part of 'branches_cubit.dart';

@immutable
abstract class BranchesState {}

class BranchesInitial extends BranchesState {}

class BranchesLoadingState extends BranchesState {}

class BranchesSuccessState extends BranchesState {
  final GetBranchesResponse getBranchesResponse;

  BranchesSuccessState(this.getBranchesResponse);
}

class BranchesErrorState extends BranchesState {
  final String error;

  BranchesErrorState(this.error);
}