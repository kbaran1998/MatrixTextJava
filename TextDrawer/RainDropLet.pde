import java.util.ArrayList;
import java.util.List;
import java.util.Random;


public class Raindroplet {
  
  private int dropletLength;
  private List<String> japaneseCharList;
  private float [] yCoordinates;
  private JapaneseAlphabetGenerator japGen;
  private Random rand;
  
  /**
  * A constuctor to the rain droplet.
  */
  public Raindroplet(int dropletLengthMax, JapaneseAlphabetGenerator japGen, Random rand) {
    this.rand = rand;
    this.japGen = japGen;
    int random = raindropletLength(dropletLengthMax);
    this.dropletLength = random == 0 ? 1 : random;
    japaneseCharList = new ArrayList<String>();
    yCoordinates = new float [this.dropletLength];
    for (int i = 0; i < this.dropletLength; i++) {
      japaneseCharList.add(japGen.getRandomCharacter());
      yCoordinates[i] = (-10)*i;
    }
  }
  
  public List<String> getDropletLetters() {
    return japaneseCharList;
  }
  
  public void changeRandomLetter(int probability) {
    if (rand.nextInt(probability) == rand.nextInt(probability)) {
      japaneseCharList.set(rand.nextInt(japaneseCharList.size()), japGen.getRandomCharacter());
    }
  }
  
  public boolean isRainDropletDrawn() {
    if (this.yCoordinates.length == 0) {
      return false;
    }
    return this.yCoordinates[this.yCoordinates.length-1] > 0 ? true : false; 
  }
  
  /**
  * Random length for a droplet with a maximum length (inclusive).
  */
  public int raindropletLength(int maxLength) {
    return this.rand.nextInt(maxLength+1);
  }
  
  public float [] getYCoordinatesList() {
    return yCoordinates;
  }
  
}
