import { User } from 'src/users/entity/user.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';

export enum JobType {
	ON_SITE = 'ON_SITE',
	HYBRID = 'HYBRID',
	REMOTE = 'REMOTE'
}

export enum ExperienceLevel {
	INTERN = 'INTERN',
	JUNIOR = 'JUNIOR',
	MID_LEVEL = 'MID_LEVEL',
	SENIOR = 'SENIOR'
}

@Entity()
export class Job {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
	title: string;

  @Column()
  description: string;

  @ManyToOne(() => User)
  @JoinColumn({ name: 'company_id'})
  company: User;

	@Column()
	location: string;

	@Column({
		type: 'enum',
    enum: JobType,
    default: JobType.ON_SITE,
	})
	type: JobType

	@Column()
	minSalary: number;

	@Column()
	maxSalary: number;

	@Column({
		type: 'enum',
		enum: ExperienceLevel,
		default: ExperienceLevel.MID_LEVEL
	})
	experienceLevel: ExperienceLevel

  @Column({
    default: new Date(),
  })
  date: Date;

	@Column({
		default: true,
	})
	opened: boolean;
}
