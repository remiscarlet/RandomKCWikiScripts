# snd110.py -- audio generation and IO

import wave
from math import *
from array import array
from struct import pack, unpack_from

ARATE = 44100
MAX_AMP = 0x7FFF

def sine_tone(freq, dur, amp):
    sine = [0.0] * int(dur * ARATE)
    for i in range(len(sine)):
        sine[i] = amp * sin(i * 2 * pi * freq / ARATE)
    return envelope(sine, 0.1, 0.2)

def samples_to_shorts(sound):
    data = bytearray()
    for s in sound:
        if abs(s) > 1:
            s = s / abs(s)
        data += pack('h', int(MAX_AMP * s))
    return data

def write_wave(name, sound):
    wf = wave.open(name, 'wb')
    wf.setnchannels(1)
    wf.setsampwidth(2)
    wf.setframerate(ARATE)
    wf.writeframes(samples_to_shorts(sound))
    #wf.writeframes(samples_to_shorts(sound))
    wf.close()

def envelope(sound, attack, decay):
    # attack is the duration of the onset
    # decay is the duration of the ending
    attack = int(attack * 44100) # convert to samples
    decay = int(decay * 44100)
    if attack + decay > len(sound):
        attack = len(sound) // 2
        decay = attack
    for i in range(attack):
        sound[i] = sound[i] * i / attack
    last = len(sound) - 1
    for i in range(decay):
        sound[last - i] = sound[last - i] * i / decay
    return sound


def read_wave(name):
    wf = wave.open(name, 'rb')
    size = wf.getnframes()
    chans = wf.getnchannels()
    data = wf.readframes(size)
    samples = []
    skip = 2 * chans # the frame size
    for i in range(size): # read first sample of each frame
        samples.append(
            unpack_from('h', data, offset = i * skip)[0] / MAX_AMP)
    return samples


#Time in Seconds of Smallest
# note in our song
tempo = 0.15

#Define the duration
# of each note based
# on the tempo
sixteenth = tempo
eighth = 2*sixteenth
quarter = 2*eighth
half = 2*quarter
dotted_half = 3*quarter 
whole = 4*quarter

#Musical Note Frequency Definitions
C4 = 261.626   # middle C
C4sh = 277.183 # C#/Db
D4 = 293.665   # D
D4sh = 311.127 # D#/Eb
E4 = 329.628
F4 = 349.228
F4sh = 269.994
G4 = 391.995
G4sh = 415.305
A4 = 440
A4sh = 466.164
B4 = 493.833
C5 = 523.251 # C (1 octave higher than C4)
C5sh =554.365
D5 = 587.330
D5sh = 622.254
E5 = 659.255
F5 = 698.456
F5sh = 739.989
G5 = 783.991
G5sh = 830.609
A5 = 880
A5sh = 932.328
B5 = 987.767
C6 = 1046.5
C6sh = 1108.73
D6 = 1174.66
D6sh = 1244.51
E6 = 1318.51
F6 = 1396.91
G6 = 1567.98

#A song is composed of a note
# (frequency) and the length
# that a note is played.
lullaby = [ [B4, half], [D5, quarter], [A4, half], [G4, eighth],
            [A4, eighth],[B4, half],  [D5, quarter],[A4, dotted_half],
            [B4, half], [D5, quarter], [A5, half], [G5, quarter],
            [D5, half], [C5, eighth], [B4, eighth], [A4, dotted_half],
            [B4, half], [D5, quarter], [A4, half], [G4, eighth],
            [A4, eighth], [B4, half], [D5, quarter],[A4, dotted_half],
            [B4, half], [D5, quarter], [A5, half], [G5, quarter],
            [D6, 7*quarter],[D6, half],[C6, eighth],[B5, eighth],
            [C6, eighth], [B5, eighth], [G5, half], [C6, half],
            [B5, eighth], [A5, eighth], [B5, eighth],[A5, eighth],
            [E5, half], [D6, half], [C6, eighth], [B5, eighth],
            [C6, eighth], [B5, eighth], [G5, quarter], [C6, quarter],
            [G6, 3*half], [0, 2*half] ]

class_song = [ [C4, eighth], [G5, quarter], [D5, 3*quarter], [E6, eighth],
               [B4, quarter], [A5, eighth], [D5, half], [A4, eighth],
               [E4, quarter], [A4, eighth], [C6, eighth], [B5, eighth],
               [C5, half], [D4, half], [F4, quarter], [G6, eighth], [A4, half],
               [D5, 3*quarter], [C5, quarter]
              ]

def write_song(song,file_name):
    songlist = []
    for note in song:
        f = note[0]
        t = note[1]
        wave = sine_tone(f,t,1)
        songlist += wave
    write_wave(file_name,songlist)


write_song(class_song,"class_song.wav")

