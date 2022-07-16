from bottle import route, run, static_file, template, redirect
 # from bottle_login import LoginPlugin
from datetime import datetime
import RPi.GPIO as GPIO
import time
import DHT as DHT
import smbus

DHTPin = 11     #define the pin of DHT11
address = 0x48
bus=smbus.SMBus(1)
cmd=0x40
chn = 0
DHT11Power = 1
ADCPower = 1
password = 0

HOST = '192.168.0.220'



@route('/Pollen')
def Pollen():
    useless =1 
    return template ('Pollen.tpl')
    
'''
@route('/LightSensingOn')
def LightSensingOn():
    global ADCPower
    ADCPower = 1
    return ("Light Measuring On")

@route('/LightSensingOff')
def LightSensingOff():
    global ADCPower
    ADCPower = 0
    return ("Light Measuring Off")
    

@route('/DHT11/off')
def DHT11off():
    global DHT11Power
    DHT11Power = 0
    return ("DHT11 off")

@route('/DHT11/on')
def DHT11on():
    global DHT11Power
    DHT11Power = 1
    return ("DHT11 on")
'''

@route("/<deviceName>/<action>")
def action(deviceName, action):
    global DHT11Power
    global ADCPower
    

    #Green LED
    if deviceName =='DHT11':
        if action == 'on' :
            DHT11Power = 1
        elif action == 'off':
            DHT11Power = 0
    print("DHT11Power: " + str(DHT11Power))
    
    if deviceName =='Light':
        if action == 'on' :
            ADCPower = 1
        elif action == 'off':
            ADCPower = 0

    myData = {
        'DHT11' : DHT11Power,
        'Light' : ADCPower
      #  'redLed' : LedState2,
    }
    redirect("/")
    return template('main.tpl', **myData)

    



@route('/')
def serve_homepage():
    global DHT11Power
    global ADCPower
    errorQ = ''
    value = 0
    voltage = 0
    lightpercentage = 0
    if (DHT11Power == 1):
        dht = DHT.DHT(DHTPin)   #create a DHT class object
        
        chk = dht.readDHT11()     #read DHT11 and get a return value. Then determine whether data read is normal according to the return value.
        if (chk is dht.DHTLIB_OK):      #read DHT11 and get a return value. Then determine whether data read is normal according to the return value.
            errorQ = "DHT11,OK!"
            
        elif(chk is dht.DHTLIB_ERROR_CHECKSUM): #data check has errors
            errorQ = "DHTLIB_ERROR_CHECKSUM!!"
            
        elif(chk is dht.DHTLIB_ERROR_TIMEOUT):  #reading DHT times out
            errorQ = "DHTLIB_ERROR_TIMEOUT!"
            
        else:               #other errors
            errorQ = "Other error!"
        
        temp = str(dht.temperature) + " deg C"
        humid = str(dht.humidity) + "%"
        Degreeshow = "1"
        humidperc = "1"
            
        
    else:
        errorQ = 'DHT11 not on.'
        chk = 'DHT11 not on.'
        humid = 'DHT11 not on.'
        temp = 'DHT11 not on.'
        Degreeshow = "0"
        humidperc = "0"
        
    if (ADCPower == 1):
        value = bus.read_byte_data(address,cmd+chn)
        
        voltage = value / 255.0 * 3.3
        lightpercentage = value * 100
        lightpercentage /= 250
        lightpercentage = str(100 - lightpercentage) + "%"
    else:
        voltage = 'Light Sensor not on.'
        value = 'Light Sensor not on.'
        lightpercentage = 'Light Sensor not on.'
        
    
    
    
    
    time = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
    GPIO.cleanup()    

    
    myData = {
      'tempVal' : temp,
      'humidVal' : humid,
      'myTime' : time,
      'chk' : chk,
      'error' : errorQ,
      'ADCVal' : value,
      'ADCVolt' : voltage,
      'LightVal' : lightpercentage,
      'DHT11' : DHT11Power,
      'Light' : ADCPower
     # 'Degree' : Degreeshow,
    #  'HumidPerc': humidperc
      }
    return template('main.tpl', **myData)


run(host=HOST, port=80, interval = 4, debug=True, reloader=False)

bus.close()
