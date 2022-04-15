#include "CO2Sensor_ESP.h"

CO2Sensor co2Sensor(32, 0.99, 100);

#include <WiFi.h>
#include <NTPClient.h>
#include <WiFiUdp.h>

// Replace with your network credentials
const char* ssid     = "PUPPY";
const char* password = "PUPPY101119";

// Define NTP Client to get time
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP);

// Variables to save date and time
String formattedDate;


//thingspeak
WiFiClient  client;
#include "ThingSpeak.h" // always include thingspeak header file after other header files and custom macros

unsigned long myChannelNumber = 1697264;    //your ID
const char * myWriteAPIKey = "D4X9DU233R5C2VIR"; // your API-KEY



void setup() {
  Serial.begin(115200);
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  // Print local IP address and start web server
  Serial.println("");
  Serial.println("WiFi connected.");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  // Initialize a NTPClient to get time
  timeClient.begin();
 
  timeClient.setTimeOffset(-18000);

  //co2 sensor
  Serial.println("=== Initialized ===");
  co2Sensor.calibrate();
  ThingSpeak.begin(client);  // Initialize ThingSpeak
}

void loop() {

  while(!timeClient.update()) {
    timeClient.forceUpdate();
  }  
  formattedDate = timeClient.getFormattedDate();
  
  int val = co2Sensor.read();  
  Serial.print(val);
  Serial.print(",");
  Serial.println(formattedDate);
  public_ThingSpeak(val);

  delay(20000);
}

void public_ThingSpeak(int co2){
  // set the fields with the values
  ThingSpeak.setField(1, (co2));
  
  

 
  
  // write to the ThingSpeak channel
  int x = ThingSpeak.writeFields(myChannelNumber, myWriteAPIKey);
  if(x == 200){
    Serial.println("Channel update successful.");
  }
  else{
    Serial.println("Problem updating channel. HTTP error code " + String(x));
  }
  
  
  
  //delay(20000); // Wait 20 seconds to update the channel again
  
}
