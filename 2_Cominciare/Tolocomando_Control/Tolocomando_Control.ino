
/*

************   MUSEOMIX Bologna 2016
************   Museo Tolomeo
************   11-13 november 2016

************   TOLOCOMANDO
************   Galline Innamorate
*   
*   Arduino leonardo, 6 buttonsdb

*/


#include <Keyboard.h>
// Number of buttons to handle
const int buttonsCount = 7;

// Arduino PINs to use
// from 2 to 12: recordings
// 13: speeh synthesis
const int pins[buttonsCount] = {
  2,
  4,
  6,
  8,
  10,
  12,
  13
};

// Keys to send (order has to match the pins array)
const byte keys[buttonsCount] = {
  'e',
  'r',
  't',
  'y',
  'u',
  'i',
  'h'
};

// Debounce delay
const long debounceDelay = 100;

bool status[buttonsCount] = {HIGH};
long lastDebounces[buttonsCount] = {0};

void setup() {
  for (int i = 0; i < buttonsCount; ++i) {
    pinMode(pins[i], INPUT_PULLUP);
  }
  delay(5000);

  Keyboard.begin();
}

void loop() {
  for (int i = 0; i < buttonsCount; ++i) {
    handleButton(i, digitalRead(pins[i]), millis());
  }
}





/**
 * \brief Send a key press/release if needed
 *
 * \param buttonNumber Button ID to handle
 * \param pinStatus PIN status (LOW/HIGH)
 * \param now Time in millis
 */
void handleButton(const int buttonNumber, const int pinStatus, const long now) {
  if (pinStatus != status[buttonNumber] && now - debounceDelay > lastDebounces[buttonNumber]) {
    status[buttonNumber] = pinStatus;
    if (pinStatus == LOW) {
      Keyboard.press(keys[buttonNumber]);
    } else {
      Keyboard.release(keys[buttonNumber]);
    }
    lastDebounces[buttonNumber] = now;
  }
}





