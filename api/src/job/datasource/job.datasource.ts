import { Injectable, Dependencies } from '@nestjs/common';
import { getRepositoryToken, InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Job } from '../entity/job.entity';

@Injectable()
@Dependencies(getRepositoryToken(Job))
export class JobsDataSource {
  constructor(
    @InjectRepository(Job)
    private readonly jobRepository: Repository<Job>,
  ) {}

  async save({ title, description, company, location, type, minSalary, maxSalary, experienceLevel }): Promise<Job> {
    const newJob = this.jobRepository.create({
      title,
      description,
      company,
      location,
      type,
      minSalary,
      maxSalary,
      experienceLevel
    });
    return await this.jobRepository.save(newJob);
  }

  async findOne(id: number): Promise<Job> {
    return this.jobRepository.findOneBy({ id });
  }
}
