import { Body, Controller, Post, Put, UseFilters } from '@nestjs/common';
import { JobDto } from '../job.dto';
import { JobsService } from '../jobs.service';
import { HttpExceptionFilter } from '../../http-exception.filter';

@Controller('job')
@UseFilters(new HttpExceptionFilter())
export class JobsController {
  constructor(private jobService: JobsService) {}

  @Post()
  async post(@Body() jobDto: JobDto): Promise<JobDto> {
    return this.jobService.create(
      jobDto.title,
      jobDto.description,
      jobDto.company,
      jobDto.location,
      jobDto.type,
      jobDto.minSalary,
      jobDto.maxSalary,
      jobDto.experienceLevel);
  }
}