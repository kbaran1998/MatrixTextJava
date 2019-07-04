import java.util.ArrayList;
import java.util.List;
import java.util.Random;

private JapaneseAlphabetGenerator japGen;
private List <String> alphabet;
private Raindroplet [] rainArray;
private boolean [] drawnDroplet;
private int elements;
Random rand;

void setup() {
  size(1000, 1000);
  elements = width/10;
  japGen = new JapaneseAlphabetGenerator();
  alphabet = new ArrayList<String>();
  for (int i = 0; i < japGen.alphabet.size(); i++) {
    alphabet.add(new String(Character.toChars(unhex(japGen.alphabet.get(i)))));
  }
  rainArray = new Raindroplet [elements];
  drawnDroplet = new boolean[elements];
  for (int i = 0; i < rainArray.length; i++) {
    rainArray[i] = new Raindroplet(100, japGen);
    drawnDroplet[i] = false;
  }
  rand = new Random();
}

void draw() {
  background(0);
  fill(0,255,0);
  
  for (int j = 0; j < elements; j++) {
    if (drawnDroplet[j] || rand.nextInt(1000) == 1) {
      drawnDroplet[j] = true;
      for (int i = 0; i < rainArray[j].charsList.size(); i++) {
         text(rainArray[j].charsList.get(i), j*10, rainArray[j].yCoordinates[i]);
         rainArray[j].yCoordinates[i] += 2;
         rainArray[j].changeRandomLetter();
         if (rainArray[j].yCoordinates[rainArray[j].yCoordinates.length-1] > height) {
           drawnDroplet[j] = false;
           rainArray[j] = new Raindroplet(40, japGen);
         }
      }
    }
  }
}
