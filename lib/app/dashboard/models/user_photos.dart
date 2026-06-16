class UserPhotos {
  final int employeeId;
  final String employeeCode;
  final String employeeName;

  UserPhotos(
    {required this.employeeId,
     required this.employeeCode,
      required this.employeeName});

  factory UserPhotos.fromJson(Map<String, dynamic> json){
    return UserPhotos(
      employeeId: json['employeeId'],
       employeeCode: json['employeeCode'],
        employeeName: json['employeeName']);
  }
}
