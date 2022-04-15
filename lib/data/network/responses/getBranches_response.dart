import 'package:mobile/data/models/branch_model.dart';

class GetBranchesResponse {
  GetBranchesResponse({
    this.status,
    this.message,
    this.branches,
  });

  int? status;
  String? message;
  List<BranchModel>? branches;

  factory GetBranchesResponse.fromJson(Map<String, dynamic> json) =>
      GetBranchesResponse(
        status: json["status"],
        message: json["message"],
        branches: json["branches"] != null
            ? List<BranchModel>.from(
                json["branches"].map((x) => BranchModel.fromJson(x)))
            : json["branches"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "branches": List<dynamic>.from(branches!.map((x) => x.toJson())),
      };
}
