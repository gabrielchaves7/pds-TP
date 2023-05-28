import 'dart:async';
import 'dart:convert';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/home/repository/job.dart';
import 'package:premium_todo/modules/http/http_provider.dart';

class JobsRepository {
  JobsRepository({
    IHttpProvider? http,
  }) {
    this.http = http ?? getIt<IHttpProvider>();
  }

  late IHttpProvider http;

  Future<Job?> post(Job job) async {
    try {
      final body = job.toJson()
        ..addAll({'experience': 'MID_LEVEL', 'type': 'ON_SITE'});
      final response = await http.post('/api/job', body: body);

      return Job.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      print(e);
    }
  }
}
