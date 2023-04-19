import { Injectable, Dependencies } from '@nestjs/common';
import { getRepositoryToken, InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Score } from '../entity/score.entity';

@Injectable()
@Dependencies(getRepositoryToken(Score))
export class ScoreDataSource {
  constructor(
    @InjectRepository(Score)
    private readonly scoreRepository: Repository<Score>,
  ) {}

  async save({ annualIncome, monthlyCosts, status }): Promise<Score> {
    const newScore = this.scoreRepository.create({
      annualIncome,
      monthlyCosts,
      status,
    });
    return await this.scoreRepository.save(newScore);
  }

  async get(): Promise<Score[]> {
    return this.scoreRepository.find({
      order: {
        date: 'DESC',
      },
      take: 5,
    });
  }
}
