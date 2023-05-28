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

  async save({ name,
    description,
    contactPhone,
    email,
    company,
    location,
    type,
    minSalary,
    maxSalary,
    imageUrl,
    experience }): Promise<Job> {
    const newJob = this.jobRepository.create({
      name,
    description,
    contactPhone,
    email,
    company,
    location,
    type,
    minSalary,
    maxSalary,
    imageUrl,
    experience
    });
    return await this.jobRepository.save(newJob);
  }

  async findOne(id: number): Promise<Job> {
    return this.jobRepository.findOneBy({ id });
  }
}
