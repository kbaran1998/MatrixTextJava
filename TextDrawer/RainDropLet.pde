import java.util.ArrayList;
import java.util.List;
import java.util.Random;


public class Raindroplet {
  int dropletLength;
  List<String> charsList;
  List<Float> yCoordinates;
  JapaneseAlphabetGenerator japGen;
  Random rand;
  
  /**
  * A constuctor to the rain droplet.
  */
  public Raindroplet(int dropletLength, JapaneseAlphabetGenerator japGen) {
    this.japGen = japGen;
    this.dropletLength = dropletLength;
    charsList = new ArrayList<String>();
    yCoordinates = new ArrayList<Float>();
    for (int i = 0; i < dropletLength; i++) {
      charsList.add(japGen.getRandomCharacter());
      float y = 10*i;
      yCoordinates.add(y);
    }
    rand = new Random();
  }
  
  public void changeRandomLetter() {
    charsList.set(rand.nextInt(charsList.size()), japGen.getRandomCharacter());
  }
  
}
