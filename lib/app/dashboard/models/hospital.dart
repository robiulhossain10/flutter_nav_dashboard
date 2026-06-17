class Hospital {
  final int id;
  final String sampleId;
  final String patientName;
  final String testCodes;
  final String status;
  final String createdAt;

  Hospital({
    required this.id,
    required this.sampleId,
    required this.patientName,
    required this.testCodes,
    required this.status,
    required this.createdAt,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['ID'],
      sampleId: json['sampleId'],
      patientName: json['patientName'],
      testCodes: json['testCodes'],
      status: json['status'],
      createdAt: json['createdAt'],
    );
  }
}
