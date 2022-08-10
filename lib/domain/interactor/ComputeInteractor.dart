import 'package:tape_letape/domain/model/Score.dart';

class ScoreIteractor {

  Score addBigCard(Score score) {
    return Score(
        score.bigCardCount + 1,
        score.smallCardCount
    );
  }

  Score removeBigCard(Score score) {
    if(score.bigCardCount == 0){
      return score;
    }
    return Score(
        score.bigCardCount - 1,
        score.smallCardCount
    );
  }

  Score addSmallCard(Score score) {
    return Score(
        score.bigCardCount,
        score.smallCardCount + 1
    );
  }

  Score removeSmallCard(Score score) {
    if(score.smallCardCount == 0){
      return score;
    }
    return Score(
        score.bigCardCount,
        score.smallCardCount - 1
    );
  }

  int computeScore(Score score) {
    int bigCardScore = score.bigCardCount * _bigCardScoreValue;
    int smallCardScore = score.smallCardCount * _smallCardScoreValue;
    return bigCardScore + smallCardScore;
  }

  int _bigCardScoreValue = 30;
  int _smallCardScoreValue = 10;

}