#include <Arduino.h>

#define BRAKE_FRONT_PIN 5
#define BRAKE_REAR_PIN 6
#define TRACTION_MOTOR_PIN 8
#define DIRECTION_ENA_PIN 9
#define DIRECTION_IN1_PIN 10
#define DIRECTION_IN2_PIN 11

void ReportStatus();
void Traction_MotorOn();
void Traction_MotorOff();
void Turn_Left();
void Turn_Right();
void Turn_Stop();
void Vehicle_Reset();
void Brake_Front();
void Brake_Rear();

void ReportStatus()
{
	Serial.println("Motor Status: ");
	Serial.print(digitalRead(TRACTION_MOTOR_PIN));
	Serial.println("Turning Status: ");
	Serial.print(digitalRead(DIRECTION_ENA_PIN));
}

void Brake_Front()
{
	digitalWrite(BRAKE_FRONT_PIN, HIGH);
	delay(1000);
	digitalWrite(BRAKE_FRONT_PIN, LOW);
}

void Brake_Rear()
{
	digitalWrite(BRAKE_REAR_PIN, HIGH);
	delay(1000);
	digitalWrite(BRAKE_REAR_PIN, LOW);
}

void Traction_MotorOn()
{
	digitalWrite(TRACTION_MOTOR_PIN, HIGH);
}

void Traction_MotorOff()
{
	digitalWrite(TRACTION_MOTOR_PIN, LOW);
}

void Turn_Right()
{
	digitalWrite(DIRECTION_IN1_PIN, HIGH);
	digitalWrite(DIRECTION_IN2_PIN, LOW);
	digitalWrite(DIRECTION_ENA_PIN, HIGH);
	delay(1000);
	digitalWrite(DIRECTION_ENA_PIN, LOW);
}

void Turn_Left()
{
	digitalWrite(DIRECTION_IN1_PIN, LOW);
	digitalWrite(DIRECTION_IN2_PIN, HIGH);
	digitalWrite(DIRECTION_ENA_PIN, HIGH);
	delay(1000);
	digitalWrite(DIRECTION_ENA_PIN, LOW);
}

void Turn_Stop()
{
	digitalWrite(DIRECTION_IN1_PIN, LOW);
	digitalWrite(DIRECTION_IN2_PIN, LOW);
	digitalWrite(DIRECTION_ENA_PIN, LOW);
}

void Vehicle_Reset()
{
	Traction_MotorOff();
	Turn_Stop();
}

void setup()
{
	Serial.begin(9600);
	Serial.println("AgroBot RTK Started");

	pinMode(TRACTION_MOTOR_PIN, OUTPUT);
	pinMode(DIRECTION_ENA_PIN, OUTPUT);
	pinMode(DIRECTION_IN1_PIN, OUTPUT);
	pinMode(DIRECTION_IN2_PIN, OUTPUT);
	pinMode(BRAKE_FRONT_PIN, OUTPUT);
	pinMode(BRAKE_REAR_PIN, OUTPUT);
}

void loop()
{
	if (Serial.available())
	{
		char cmd = Serial.read();
		switch (cmd)
		{
		case 'z':
			Serial.println("Called Command: ReportStatus");
			ReportStatus();
			break;
		case 'a':
			Serial.println("Called Command: Turn_Left");
			Turn_Left();
			break;
		case 'd':
			Serial.println("Called Command: Turn_Right");
			Turn_Right();
			break;
		case 'w':
			Serial.println("Called Command: Traction_MotorOn");
			Traction_MotorOn();
			break;
		case 's':
			Serial.println("Called Command: Traction_MotorOff");
			Traction_MotorOff();
			break;
		case 'x':
			Serial.println("Called Command: Turn_Stop");
			Turn_Stop();
			break;
		case 'j':
			Serial.println("Called Command: Brake_Front");
			Brake_Front();
			break;
		case 'k':
			Serial.println("Called Command: Brake_Rear");
			Brake_Rear();
			break;
		case ' ':
			Serial.println("Called Command: Vehicle_Reset");
			Vehicle_Reset();
			break;
		default:
			break;
		}
	}
}