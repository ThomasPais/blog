
+++
title = "SDL3 Quickstart"
description = "This guide will show you how to set up a cross-platform C project using SDL3, SDL Image, and SDL Mixer with CMake."
date = 2026-04-19
# updated = 2026-04-20
draft = false
[taxonomies]
tags = ["SDL", "C"]
+++

## Overview

[Simple DirectMedia Layer (SDL)](https://libsdl.org) is the industry standard for handling platform-specific hardware access—think windows,
graphics context, audio, and input under a single, unified C API.
With SDL, you can build the same project for any platform like consoles or web.

With the recent release of SDL3, the library has been greatly improve for modern hardware.
We will use the main [SDL3](https://github.com/libsdl-org/SDL) library but also two optional libraries:

- [SDL3_image](https://github.com/libsdl-org/SDL_image) to handle image formats like `.png`
- [SDL3_mixer](https://github.com/libsdl-org/SDL_mixer) to handle audio

These 3 libraries are enough to make most simple cross platform applications with a lot of boilerplate handled for us.

### Project Structure

The project file structure is the following:

```
myproject/
├─ assets/         # Images, sounds, and fonts
├─ build/          # Compiled binaries (should be ignored by Git)
├─ include/        # Custom .h headers
├─ src/            # .c source files
│  └─ main.c
└─ CMakeLists.txt  # Build configuration
```

## CMake Configuration

[CMake](https://cmake.org) is a build system that managed the build process of our code.
We use CMake not just to compile, but to manage our dependencies.
The script below uses `FetchContent`, which automatically downloads
the specific versions of SDL3 from GitHub if they aren't found on your system.

The project CMake configuration is in the `CMakeLists.txt` file at the root of the project:

```cmake
cmake_minimum_required(VERSION 4.3)
project(myproject C)

set(CMAKE_C_STANDARD 23)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Ensure DLLs are in the same directory as the binary file
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<CONFIGURATION>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<CONFIGURATION>")

# Get libraries online if not installed locally
include(FetchContent)
function(include_dependency libName gitURL gitTag)
    FetchContent_Declare(${libName}
            GIT_REPOSITORY ${gitURL}
            GIT_TAG        ${gitTag}
            GIT_SHALLOW    TRUE
            GIT_PROGRESS   TRUE
    )
    FetchContent_MakeAvailable(${libName})
endfunction()

find_package(SDL3 QUIET)
if (NOT SDL3_FOUND)
    message(STATUS "Getting SDL3 from Github")
    include_dependency(SDL3 https://github.com/libsdl-org/SDL.git release-3.4.4)
else()
    message(STATUS "Using local SDL3")
endif()

find_package(SDL3_image QUIET)
if (NOT SDL3_image_FOUND)
    message(STATUS "Getting SDL3_image from Github")
    include_dependency(SDL3_image https://github.com/libsdl-org/SDL_image.git release-3.2.4)
else()
    message(STATUS "Using local SDL3_image")
endif()

find_package(SDL3_mixer QUIET)
if (NOT SDL3_mixer_FOUND)
    message(STATUS "Getting SDL3_mixer from Github")
    include_dependency(SDL3_mixer https://github.com/libsdl-org/SDL_mixer.git release-3.2.0)
else()
    message(STATUS "Using local SDL3_mixer")
endif()

# Include header files
include_directories(include)
# Add source files
file(GLOB SOURCES "src/*.c")
add_executable(myproject ${SOURCES})
# Optional: Use SDL3 callbacks
target_compile_definitions(myproject PRIVATE SDL_MAIN_USE_CALLBACKS)

# Link libraries
target_link_libraries(myproject PRIVATE
  SDL3::SDL3
  SDL3_image::SDL3_image
  SDL3_mixer::SDL3_mixer
)
```

## Using SDL3

The [SDL3 Wiki](https://wiki.libsdl.org/SDL3/FrontPage) is a treasure trove of information, you can find everything about SDL3.
They also provide a lot of examples worth checking.

The callbacks make it easier to compile to specific platform like Android, IOS or Web so I recommend using them.
Here is a simple app exemple that uses the SDL3_image and SL3_mixer libraries:

```c
#include <SDL3/SDL.h>
#include <SDL3/SDL_main.h>
#include <SDL3_image/SDL_image.h>
#include <SDL3_mixer/SDL_mixer.h>
#include <stdint.h>

typedef struct {
  SDL_Window *window;
  SDL_Renderer *renderer;
  SDL_Texture *texture;
  MIX_Mixer *mixer;
  MIX_Track *sfx_track;
  MIX_Audio *sound;
} AppState;

SDL_AppResult SDL_AppInit(void **appstate, int argc, char *argv[]) {
  if (SDL_Init(SDL_INIT_VIDEO) == false) {
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, "Couldn't initialize SDL!",
                             SDL_GetError(), NULL);
    return SDL_APP_FAILURE;
  }

  if (!MIX_Init()) {
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR,
                             "Couldn't initialize SDL Mixer!", SDL_GetError(),
                             NULL);
    return SDL_APP_FAILURE;
  }

  // Init the app state
  AppState *app = SDL_calloc(1, sizeof(AppState));
  if (!app) {
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, "Couldn't allocate memory!",
                             SDL_GetError(), NULL);
    return SDL_APP_FAILURE;
  }

  if (SDL_CreateWindowAndRenderer("Hello SDL3", 1280, 720, 0, &app->window,
                                  &app->renderer) == false) {
    SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR,
                             "Couldn't create window/renderer!", SDL_GetError(),
                             NULL);
    return SDL_APP_FAILURE;
  }

  // Load the texture
  app->texture = IMG_LoadTexture(app->renderer, "assets/image.png");
  if (!app->texture) {
    SDL_Log("Couldn't load texture: %s", SDL_GetError());
  }

  // Init audio
  app->mixer = MIX_CreateMixerDevice(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, NULL);
  if (!app->mixer) {
    SDL_Log("Couldn't create mixer: %s", SDL_GetError());
  }

  app->sound = MIX_LoadAudio(app->mixer, "assets/sound.ogg", false);

  app->sfx_track = MIX_CreateTrack(app->mixer);
  MIX_SetTrackAudio(app->sfx_track, app->sound);

  *appstate = app;

  // return success!
  return SDL_APP_CONTINUE;
}

// This function runs when a new event occurs
SDL_AppResult SDL_AppEvent(void *appstate, SDL_Event *event) {
  AppState *app = (AppState *)appstate;

  switch (event->type) {
  case SDL_EVENT_QUIT:
    return SDL_APP_SUCCESS;

  case SDL_EVENT_KEY_DOWN:
    switch (event->key.key) {
    case SDLK_SPACE:
      MIX_PlayTrack(app->sfx_track, 0);
      break;
    
    case SDLK_ESCAPE:
      return SDL_APP_SUCCESS;
    }
    break;
  }
  // return continue to continue
  return SDL_APP_CONTINUE;
}

// This function runs once per frame, and is the heart of the program
SDL_AppResult SDL_AppIterate(void *appstate) {
  AppState *app = (AppState *)appstate;

  SDL_SetRenderDrawColor(app->renderer, 135, 206, 235, 255);
  SDL_RenderClear(app->renderer);

  // Render the texture
  SDL_RenderTexture(app->renderer, app->texture, NULL, NULL);

  // Swap buffers
  SDL_RenderPresent(app->renderer);

  // return continue to continue
  return SDL_APP_CONTINUE;
}

// This function runs once at shutdown
void SDL_AppQuit(void *appstate, SDL_AppResult result) {
  AppState *app = (AppState *)appstate;
  SDL_DestroyTexture(app->texture);
  SDL_DestroyRenderer(app->renderer);
  SDL_DestroyWindow(app->window);
  MIX_Quit();
  SDL_free(app);
}
```

> [!note]
> Don't forget to change the image and sound paths!


## Building the project

First we need to generate the build system using CMake by running this command at the root of your project:
```bash
cmake -B build
```

This command should be used when you want to add another library, build for another platform or
after a modification in the CMake configuration.

CMake will automatically use an available build tool like `make` or `ninja` but you can enforce it adding `-G Ninja` for exemple.

Then you can compile and run your code:
```bash
cmake --build build; ./build/myproject
```

> [!important]
If no image is rendered, you may need to copy your `assets` folder in the same folder as your executable. 

## Conclusion

With this starter project, you now have the foundation to build cross-platform applications using the modern SDL3 ecosystem.
By using SDL, you can focus more on your logic, rather than handling platform-specific or driver boilerplate.
