import { Body, Controller, Get, Post, UseFilters } from '@nestjs/common';
import { ScoreService } from '../service/score.service';
import { Score } from '../entity/score.entity';
import { HttpExceptionFilter } from '../../http-exception.filter';
import { ScoreRequestDto } from '../dto/score.dto';

@Controller('score')
export class ScoreController {
  constructor(private scoreService: ScoreService) {}

  @Post('')
  @UseFilters(new HttpExceptionFilter())
  async post(@Body() scoreRequestDto: ScoreRequestDto): Promise<Score> {
    return this.scoreService.post(
      scoreRequestDto.annualIncome,
      scoreRequestDto.monthlyCosts,
    );
  }

  @Get('')
  @UseFilters(new HttpExceptionFilter())
  async get(): Promise<Score[]> {
    return this.scoreService.get();
  }
}
