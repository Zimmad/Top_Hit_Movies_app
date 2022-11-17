import './status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse({this.status, this.data, this.message});

//! Below all three syntaxes output result is same

  ApiResponse.loading({this.status = Status.LOADING});

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) {
    status = Status.ERROR;
  }

  @override
  String toString() {
    return ''' 
    Status : $status 
    Message : $message
    Data : $data
''';
  }

//! Both toString methods result in same output values
  // @override
  // String toString() {
  //   return ' Status : $status \n Message : $message \n Data : $data';
  // }
}
