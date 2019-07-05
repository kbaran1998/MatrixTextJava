import java.util.ArrayList;
import java.util.List;
import java.util.Random;

private JapaneseAlphabetGenerator japGen;
private List <String> alphabet;


private List<Raindroplet> [] rainList;
private List<Boolean> [] drawnDroplets;


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
  rainList = new ArrayList[elements];
  drawnDroplets = new ArrayList[elements];
  for (int i = 0; i < elements; i++) {
    List<Raindroplet> list = new ArrayList<Raindroplet>();
    list.add(new Raindroplet(50, japGen));
    rainList[i] = list;
    
    List<Boolean> listBool = new ArrayList<Boolean>();
    listBool.add(false);
    drawnDroplets[i] = listBool;
  }
  rand = new Random();
}



void draw() {
  background(0);
  fill(0,255,0);
  for (int j = 0; j < elements; j++) {
    for (int k = 0; k < drawnDroplets[j].size(); k++) {
      if (isPreviousDropletDrawnFully(k-1, rainList[j])) {
        if (drawnDroplets[j].get(k) || rand.nextInt(500) == 1) {
          drawnDroplets[j].set(k, true); //<>//
          for (int i = 0; i < rainList[j].get(k).charsList.size(); i++) {
             text(rainList[j].get(k).charsList.get(i), j*10, rainList[j].get(k).yCoordinates[i]);
             rainList[j].get(k).yCoordinates[i] += 2.5;
             rainList[j].get(k).changeRandomLetter();
          }
        
          //if one droplet is completely drawn on the screen, add another one
          if (rainList[j].get(k).isRainDropletDrawn()) {
             rainList[j].add(new Raindroplet(50, japGen));
             drawnDroplets[j].add(false);
          }
          
          if (rainList[j].get(k).yCoordinates.length != 0 && rainList[j].get(k).yCoordinates[rainList[j].get(k).yCoordinates.length-1] > height) {
             drawnDroplets[j].remove(k);
             rainList[j].remove(k);
          }
        }
      }
    }
  }
}

public boolean isPreviousDropletDrawnFully(int previous, List<Raindroplet> list) {
  if (previous < 0) {
    return true;
  }
  return list.get(previous).isRainDropletDrawn();
}
