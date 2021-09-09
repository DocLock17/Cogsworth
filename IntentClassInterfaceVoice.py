#!/bin/bash/python3

import requests
import simpleaudio as sa
import speech_recognition as sr 
import pyttsx3
import json

r = sr.Recognizer() 
 

# Function to convert text to 
# speech 
def speak_text(message):      
    # Initialize the engine 
    engine = pyttsx3.init()
    # engine.setProperty('voice', 'en-scottish') # Raspberry
    # engine.setProperty('rate', 110) # Raspberry?
    engine.setProperty('rate', 180) # mac?
    engine.say(message)  
    engine.runAndWait() 

def request_response(text):
    query = {'input':text}
    # query = {'input':randint(1000,9999)}
    # print(text)
    response = requests.put('http://127.0.0.1:5000', params=query)
    # print(count,"  ", response.json()['body'])
    return response.json()['body']

speak_text("Voice Matrix Initialized")
while(1):     
      
    # Exception handling to handle 
    # exceptions at the runtime 
    try: 
          
        # use the microphone as source for input. 
        with sr.Microphone() as source2: 
              
            # wait for a second to let the recognizer 
            # adjust the energy threshold based on 
            # the surrounding noise level  
            r.adjust_for_ambient_noise(source2, duration=0.2) 
              
            #listens for the user's input  
            audio2 = r.listen(source2) 
              
            # Using ggogle to recognize audio 
            MyText = r.recognize_google(audio2) 
            MyText = MyText.lower()
            print(MyText)
            if MyText != "":
                print("Getting Response")
                # print(MyText)
                res = request_response(MyText)
                speak_text(res)


    except sr.RequestError as e: 
        print("Could not request results; {0}".format(e)) 
          
    except sr.UnknownValueError: 
        print("No Speech Detected")
#         speak_text("Come say something into the microphone")
