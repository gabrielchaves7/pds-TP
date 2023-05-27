import { Module } from '@nestjs/common';
import { JobsService } from './jobs.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Job } from './entity/job.entity';
import { JobsDataSource } from './datasource/job.datasource';

@Module({
  imports: [TypeOrmModule.forFeature([Job])],
  providers: [JobsService, JobsDataSource],
  exports: [JobsService, TypeOrmModule],
})
export class JobsModule {}
