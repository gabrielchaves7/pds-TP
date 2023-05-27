import 'dart:async';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/home/repository/company.dart';
import 'package:premium_todo/modules/http/http_provider.dart';

class HomeRepository {
  HomeRepository({
    IHttpProvider? http,
  }) {
    this.http = http ?? getIt<IHttpProvider>();
  }

  late IHttpProvider http;

  Future<List<Company>> get() async {
    try {
      final response = mockedCompanyJobsJson;

      return response.map(Company.fromJson).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}

final mockedCompanyJobsJson = [
  {
    "name": "Nome da Vaga",
    "location": "Localização da vaga",
    "minSalary": 0,
    "maxSalary": 100.000,
    "contactPhone": "31982499345",
    "email": "Email",
    "description": "Descrição da vaga"
  },
  {
    "name": "Nome da Vaga",
    "location": "Localização da vaga",
    "minSalary": 0,
    "maxSalary": 100.000,
    "contactPhone": "31982499345",
    "email": "Email",
    "description": "Descrição da vaga"
  },
  {
    "name": "Nome da Vaga",
    "location": "Localização da vaga",
    "minSalary": 0,
    "maxSalary": 100.000,
    "contactPhone": "31982499345",
    "email": "Email",
    "description": "Descrição da vaga"
  },
  {
    "name": "Nome da Vaga",
    "location": "Localização da vaga",
    "minSalary": 0,
    "maxSalary": 100.000,
    "contactPhone": "31982499345",
    "email": "Email",
    "description": "Descrição da vaga"
  },
];
