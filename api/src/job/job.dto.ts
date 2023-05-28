import { ApiProperty } from '@nestjs/swagger';
import { Job, JobType, ExperienceLevel } from '../job/entity/job.entity';
import { IsBoolean, IsDate, IsEnum, IsNumber, IsString, IsTaxId, isNumber } from 'class-validator';
import { User } from 'src/users/entity/user.entity';

export class JobDto {
    // @IsNumber()
    // @ApiProperty({
    //     description: 'The number of the job'
    // })
    // id: number;

    @IsString()
    @ApiProperty({
        description: 'Title of the job'
    })
    title: string

    @IsString()
    @ApiProperty({
        description: 'Descripiton of the job'
    })
    description: string;

    @ApiProperty({
        description: 'Company of the job'
    })
    company: User;

    @IsString()
    @ApiProperty({
        description: 'Location of the job'
    })  
    location: string;

    @IsEnum(JobType)
    @ApiProperty({
    enum: ['ON_SITE', 'HYBRID', 'REMOTE'],
    description: 'The type of job',
    default: JobType.ON_SITE,
  })
    type: JobType;

    @IsNumber()
    @ApiProperty({
        description: 'Min salary of the job'
    })
    minSalary: number;

    @IsNumber()
    @ApiProperty({
        description: 'Max salary of the job'
    })
    maxSalary: number;

    @IsEnum(ExperienceLevel)
    @ApiProperty({
    enum: ['INTERN', 'JUNIOR', 'MID_LEVEL', 'SENIOR'],
    description: 'Experience level of job',
    default: ExperienceLevel.MID_LEVEL,
  })
    experienceLevel: ExperienceLevel;

    @IsDate()
    @ApiProperty({
        description: 'Date of creation of the job'
    })
    date: Date;

    @IsBoolean()
    @ApiProperty({
        description: 'Set if the job is opened'
    })
    opened: boolean;
}
