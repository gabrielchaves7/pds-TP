import 'dart:async';
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
      final response = http.post('/api/job', body: job.toJson());

      return job;
    } catch (e) {
      print(e);
    }
  }
}
