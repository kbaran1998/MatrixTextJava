import java.util.ArrayList;
import java.util.List;


private JapaneseAlphabetGenerator japGen;
private List <String> alphabet;
private float y;


void setup() {
  size(500, 500);
  japGen = new JapaneseAlphabetGenerator();
  alphabet = new ArrayList<String>();
  for (int i = 0; i < japGen.alphabet.size(); i++) {
    alphabet.add(new String(Character.toChars(unhex(japGen.alphabet.get(i)))));
  }
  y = 0;
}

void draw() {
  background(0);
  fill(0,255,0);
  text(alphabet.get(4), width/2, y); 
  y = y + 1;
  if (y > height) {
    y = 0;
  }
}
