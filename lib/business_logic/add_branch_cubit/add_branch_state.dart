part of 'add_branch_cubit.dart';

@immutable
abstract class AddBranchState {}

class AddBranchInitial extends AddBranchState {}

class AddBranchLoadingState extends AddBranchState {}

class AddBranchSuccessState extends AddBranchState {
  final SuccessfulResponse successfulResponse;

  AddBranchSuccessState(this.successfulResponse);
}

class AddBranchErrorState extends AddBranchState {
  final String error;

  AddBranchErrorState(this.error);
}

