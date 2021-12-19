class ApiResponse{
  final String status;
  final String message;
  final dynamic data;

  ApiResponse(
      {required this.status, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    status: json['status'],
    message: json['message']??'',
    data: json['data'],
  );
}