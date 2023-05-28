import { Module } from '@nestjs/common';
import { JobsService } from './jobs.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Job } from './entity/job.entity';
import { JobsDataSource } from './datasource/job.datasource';
import { User } from 'src/users/entity/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Job]), TypeOrmModule.forFeature([User])],
  providers: [JobsService, JobsDataSource],
  exports: [JobsService, TypeOrmModule],
})
export class JobsModule {}
