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
      final body = job.toJson()..addAll({'type': 'ON_SITE'});
      final response = await http.post('/api/job', body: body);

      return Job.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Job>> get(int userId) async {
    try {
      final response = await http.get('/api/job/$userId');

      final responseBody = jsonDecode(response.body) as List<dynamic>;

      return responseBody
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, stacktrace) {
      print(e);
      return [];
    }
  }
}
