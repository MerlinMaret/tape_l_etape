import 'package:tape_letape/domain/model/Score.dart';

class ComputeScoreIteractor {

  Score addBigCard(Score score) {
    return score.copy(
      bigCardCount: score.bigCardCount + 1
    );
  }

  Score removeBigCard(Score score) {
    if(score.bigCardCount == 0){
      return score;
    }
    return score.copy(
        bigCardCount: score.bigCardCount - 1
    );
  }

  Score addSmallCard(Score score) {
    return score.copy(
        smallCardCount: score.smallCardCount + 1
    );
  }

  Score removeSmallCard(Score score) {
    if(score.smallCardCount == 0){
      return score;
    }
    return score.copy(
        smallCardCount: score.smallCardCount - 1
    );
  }

  int computeScore(Score score) {
    int bigCardScore = score.bigCardCount * _bigCardScoreValue;
    int smallCardScore = score.smallCardCount * _smallCardScoreValue;
    return bigCardScore + smallCardScore;
  }

  final int _bigCardScoreValue = 30;
  final int _smallCardScoreValue = 10;

}