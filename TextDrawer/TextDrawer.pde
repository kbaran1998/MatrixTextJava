//private PFont f;

void setup() {
  size(400, 400);
  //f = createFont("Arial", 40, true);
  background(0);
  fill(0,255,0);
  String ch = new String(Character.toChars(unhex("30A1")));
  //textSize(20); /// DO NOT CHANGE size. It does not represent the uncode char anymore
  text(ch, width/2, height/2);
  text(ch, width/2, height/2+10); // Space in between characters is 10
  text(ch, width/2+10, height/2);
}

void draw() {
  
  //textFont(f,16);
}

///fill(0);
  //String sh = "30A1";
  //int n = unhex(sh);
  
  //char[] chars = Character.toChars(n);
  //String ch = new String(chars);
  //println(ch);
  //text(ch, 50, 50);
