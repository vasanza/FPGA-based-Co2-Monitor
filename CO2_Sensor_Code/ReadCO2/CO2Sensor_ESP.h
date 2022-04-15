/*
  CO2Sensor_ESP.h - Reading and calibrating CO2 module
  Created by Sergi Adamchuk but edit by Kevin Chica, March, 2022.
  Edit for reading on the ESP 32.
*/
#ifndef CO2Sensor_h
#define CO2Sensor_h

#include <Arduino.h>

class CO2Sensor
{
  public:
    CO2Sensor(int analogPin);
    CO2Sensor(int analogPin, float inertia, int tries);
    int read();
    void calibrate();

    int getVoltage();

    int getGreenLevel();
    int getRedLevel();

  private:
    void init();

    int _analogPin;
    int _inertia;
    int _tries;
    int _co2_v;
    int _greenLevel;
    double _co2_a;
    double _co2ppm;
};

#endif
