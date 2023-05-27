import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ScoreController } from './score/controller/score.controller';
import { ScoreModule } from './score/score.module';
import { Score } from './score/entity/score.entity';
import { ScoreService } from './score/service/score.service';
import { TaxController } from './tax/controller/tax.controller';
import { TaxService } from './tax/service/tax.service';
import { Tax } from './tax/entity/tax.entity';
import { TaxModule } from './tax/tax.module';
import { ConfigModule } from '@nestjs/config';
import { AnnualCostsThreshold } from './score/entity/annual-costs-threshold.entity';
import { ScoreDataSource } from './score/datasource/score.datasource';
import { AnnualCostsThresholdDataSource } from './score/datasource/annual-costs-threshold.datasource';
import { TaxDataSource } from './tax/datasource/tax.datasource';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { User } from './users/entity/user.entity';
import { JobsModule } from './job/job.module';
import { JobsController } from './job/controller/job.controller';
import { JobsDataSource } from './job/datasource/job.datasource';
import { Job } from './job/entity/job.entity';

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,
      port: process.env.DB_PORT as unknown as number,
      username: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      synchronize: true,
      entities: [Score, Tax, AnnualCostsThreshold, User, Job],

      migrations: [],
    }),
    ScoreModule,
    TaxModule,
    AuthModule,
    UsersModule,
    JobsModule,
  ],
  controllers: [ScoreController, TaxController, JobsController],
  providers: [
    ScoreService,
    ScoreDataSource,
    AnnualCostsThresholdDataSource,
    TaxService,
    TaxDataSource,
    JobsDataSource,
  ],
})
export class AppModule {}
