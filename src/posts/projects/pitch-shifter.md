---
title: Pitch Shifter
description: Projet de conception d'un pitch-shifter à l'aide d'un DSP et de Bare Metal Framework.
date: '2023-4-14'
categories:
  - Traitement du signal
  - DSP
published: true
---

## Markdown

# Introduction

## What is a Pitch Shifter ?

Good
- Change pitch
- Preserve tempo and duration

Bad 
- Atonal / Inharmonic artefacts
- Echoey or diffuse sound (transients)
- Fluttery or robotic sound


# Time domain

## Similarity with a Time Stretcher
Good
- Change tempo and duration
- Preserve pitch

Bad 
- Atonal / Inharmonic artefacts
- Echoey or diffuse sound (transients)
- Fluttery or robotic sound
  
### Pitch Shifter = Time Stretcher
Time Stretcher => Pitch Shifter  :

 We can pass from a Time Stretcher to a Pitch Shifter by stretching time and changing playback rate

Pitch Shifter => Time Stretcher :

Similarly we can pass from a Pitch Shifter to a Time Shifter by changing the playback rate and shifting the pitch

## SOLA

# Frequency domain




### Aliasing
Nyquist frequency

Hey friends! 👋

```ts
function greet(name: string) {
	console.log(`Hey ${name}! 👋`)
}
```