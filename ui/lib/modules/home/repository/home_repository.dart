import 'dart:async';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/home/repository/job.dart';
import 'package:premium_todo/modules/http/http_provider.dart';

class HomeRepository {
  HomeRepository({
    IHttpProvider? http,
  }) {
    this.http = http ?? getIt<IHttpProvider>();
  }

  late IHttpProvider http;

  Future<List<Job>> get() async {
    try {
      final response = mockedCompanyJobsJson;

      return response.map(Job.fromJson).toList();
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
    "companyName": "Empresa 1",
    "minSalary": 10.000,
    "maxSalary": 20.000,
    "contactPhone": "31982499345",
    "email": "Email",
    "experience": "all",
    "description":
        "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt."
  },
  {
    "name": "Nome da Vaga",
    "location": "Localização da vaga",
    "companyName": "Empresa 1",
    "minSalary": 0,
    "maxSalary": 40.000,
    "contactPhone": "31982499345",
    "email": "Email",
    "experience": "entryLevel",
    "description":
        "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt."
  },
  {
    "name": "Nome da Vaga",
    "location": "Localização da vaga",
    "companyName": "Empresa 1",
    "minSalary": 0,
    "maxSalary": 60.000,
    "contactPhone": "31982499345",
    "email": "Email",
    "experience": "entryLevel",
    "description":
        "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt."
  },
  {
    "name": "Nome da Vaga",
    "location": "Localização da vaga",
    "companyName": "Empresa 1",
    "minSalary": 0,
    "maxSalary": 120.000,
    "contactPhone": "31982499345",
    "email": "Email",
    "experience": "midSeniorLevel",
    "description":
        "Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt."
  },
];
