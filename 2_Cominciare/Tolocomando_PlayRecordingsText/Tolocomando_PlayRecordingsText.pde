/*

************   MUSEOMIX Bologna 2016
************   Museo Tolomeo
************   11-13 november 2016

************   TOLOCOMANDO
************   Galline Innamorate

*/

import java.io.IOException;

import ddf.minim.*;
import cc.arduino.*;



Minim minim;

// 6 recordings, 6 players
AudioPlayer player1a, player1b;
AudioPlayer player2a, player2b;
AudioPlayer player3a, player3b;

// arduino
Arduino arduino;
 
int waitTime=0; 
boolean speaking = false;

Runtime rt; 
Process p1; 



void setup()
{
  
  minim = new Minim(this);
  
  // Loading waves
  player1a = minim.loadFile("tasto1.wav"); player1a.setGain(6.0);  
  player1b = minim.loadFile("tasto2.wav"); player1b.setGain(6.0);  
  player2a = minim.loadFile("tasto3.wav"); player2a.setGain(6.0);  
  player2b = minim.loadFile("tasto4.wav"); player2b.setGain(6.0);  
  player3a = minim.loadFile("tasto5.wav"); player3a.setGain(6.0);  
  player3b = minim.loadFile("tasto6.wav"); player3b.setGain(6.0);  
  
  // TEST
  //playmySound(0);
  println(player1a.getGain());
  
}

void draw()
{
  background(0);
  
}


////////////////////////////////////////////////////////////
// FUNCTIONS

// Playing Sounds
void playmySound(int choice) {
  // 1) Playing recordings
  if(choice==0) {
    // all are mute
    player1a.play();
    player1b.pause();
    player2a.pause();
    player2b.pause();
    player3a.pause();
    player3b.pause();
    player1a.rewind();
    player1b.rewind();
    player2a.rewind();
    player2b.rewind();
    player3a.rewind();
    player3b.rewind();
    stopSynthesis();
    // One is playing,
    player1a.play();
  } else if(choice==1) {
    // all are mute
    player1a.pause();
    player1b.play();
    player2a.pause();
    player2b.pause();
    player3a.pause();
    player3b.pause();
    player1a.rewind();
    player1b.rewind();
    player2a.rewind();
    player2b.rewind();
    player3a.rewind();
    player3b.rewind();
    stopSynthesis();
    // One is playing,
    player1b.play();
  } else if(choice==2) {
    // all are mute
    player1a.pause();
    player1b.pause();
    player2a.play();
    player2b.pause();
    player3a.pause();
    player3b.pause();
    player1a.rewind();
    player1b.rewind();
    player2a.rewind();
    player2b.rewind();
    player3a.rewind();
    player3b.rewind();
    stopSynthesis();
    // One is playing,
    player2a.play();
  } else if(choice==3) {
    // all are mute
    player1a.pause();
    player1b.pause();
    player2a.pause();
    player2b.play();
    player3a.pause();
    player3b.pause();
    player1a.rewind();
    player1b.rewind();
    player2a.rewind();
    player2b.rewind();
    player3a.rewind();
    player3b.rewind();
    stopSynthesis();
    // One is playing,
    player2b.play();
  } else if(choice==4) {
    // all are mute
    player1a.pause();
    player1b.pause();
    player2a.pause();
    player2b.pause();
    player3a.play();
    player3b.pause();
    player1a.rewind();
    player1b.rewind();
    player2a.rewind();
    player2b.rewind();
    player3a.rewind();
    player3b.rewind();
    stopSynthesis();
    // One is playing,
    player3a.play();
  } else if(choice==5) {
    // all are mute
    player1a.pause();
    player1b.pause();
    player2a.pause();
    player2b.pause();
    player3a.pause();
    player3b.play();
    player1a.rewind();
    player1b.rewind();
    player2a.rewind();
    player2b.rewind();
    player3a.rewind();
    player3b.rewind();
    stopSynthesis();
    // One is playing,
    player3b.play();
  } else {
    // Speech synthesis
    player1a.pause();
    player1b.pause();
    player2a.pause();
    player2b.pause();
    player3a.pause();
    player3b.pause();
    player1a.rewind();
    player1b.rewind();
    player2a.rewind();
    player2b.rewind();
    player3a.rewind();
    player3b.rewind();
    
    //2) Read a text
    String text = "The Kurzweil machine announces user with this simple command. It can be said that it is a first of humanity towards what is called the Singularity: the machine that talks to you think independently. To learn, understand, you need to listen. Hearing is a touching distance. It is physical and psycho-physical phenomenon. Tolomeo museum tells us, it resounds through a series of concerted sounds.";
    //String text = "La macchina Kurzweil si annuncia al suo utilizzatore con questo semplice comando. Si può dire che sia un primo dell'umanità verso quella che si chiama la singularità: la macchina che parla a si pensa in autonomia. Per apprendere, comprendere  è necessario ascoltare. Udire è un toccare a distanza. È fenomeno fisico e psicofisico. Museo Tolomeo ci parla, risuona, attraverso una serie di suoni concertati.";
    //speed
    int voiceSpeed = 150;
   
    //reset the wait time according to length of text and speed
    //the 50 is a "magic number" you may need to tweak it according to your needs
    //waitTime = text.length() * voiceSpeed / 50;
   
    say(text, "Vicki", voiceSpeed); // Alex, Victoria
  }
}

// Control
void keyPressed() {
  if (key == 'e') {
    println('e');
    // CONOSCENZA (a)
    playmySound(0);
  } else if (key == 'r') {
    println('r');
    // CONOSCENZA (b)
    playmySound(1);
  } else if(key == 't') {
    println('t');
    // EMOZIONE (a)
    playmySound(2);
  } else if (key == 'y') {
    println('y');
    // EMOZIONE (b)
    playmySound(3);
  } else if (key == 'u') {
    println('u');
    // ESISTENZA (a)
    playmySound(4);
  } else if (key == 'i') {
    println('i');
    // ESISTENZA (b)
    playmySound(5);
  } else if(key == 'h') {
    println('h');
    stopSynthesis();
    // Reading a text
    playmySound(10);
  }
}

// Speech Synthesis
void say(String script, String voice, int speed) {
  try {
    rt = Runtime.getRuntime(); // creates Runtime rt
    p1 = rt.exec(new String[] {"say", "-v", voice, "[[rate " + speed + "]]" + script }); // creates Process p1 on Runtime rt.
    /*Runtime.getRuntime().exec(new String[] {
      "say", "-v", voice, "[[rate " + speed + "]]" + script
    }
    );*/
    speaking = true;
  }
  catch (IOException e) {
    System.err.println("IOException");
  }
}

void stopSynthesis() {
  if(speaking) {
    p1.destroy();
    speaking = false;
  }
}


 void stop()
{
  player1a.close();
  player1b.close();
  player2a.close();
  player2b.close();
  player3a.close();
  player3b.close();
  minim.stop();
  super.stop();
} 
