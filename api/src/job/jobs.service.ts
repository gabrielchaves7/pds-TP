import { Inject, Injectable } from '@nestjs/common';
import { JobsDataSource } from './datasource/job.datasource';

@Injectable()
export class JobsService {
  constructor(
    @Inject(JobsDataSource) private readonly jobsDataSource: JobsDataSource,
  ) {}

  async findOne(id) {
    var job = await this.jobsDataSource.findOne(id);
    return job;
  }

  async get() {
    var jobs = await this.jobsDataSource.get();
    return jobs;
  }

  async create(
    name,
    description,
    contactPhone,
    email,
    companyId,
    location,
    type,
    minSalary,
    maxSalary,
    imageUrl,
    experience,
  ) {
    return this.jobsDataSource.save({
      name,
      description,
      contactPhone,
      email,
      companyId,
      location,
      type,
      minSalary,
      maxSalary,
      imageUrl,
      experience,
    });
  }
}
