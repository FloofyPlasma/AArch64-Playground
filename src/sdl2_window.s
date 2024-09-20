.global _main
.align 4

#define SDL_WINDOWPOS_CENTERED 0x2FFF0000u
#define SDL_INIT_VIDEO 0x00000020
#define SDL_QUIT 0x100

_main:
  // Init SDL
  mov X0, #SDL_INIT_VIDEO
  bl _SDL_Init
  cmp X0, #0 // SDL initialized
  b.ne _exit_with_error

  adr X0, window_title // Pointer to the window title string
  mov X1, #SDL_WINDOWPOS_CENTERED
  mov X2, #SDL_WINDOWPOS_CENTERED
  mov X3, #640 // Width of window
  mov X4, #480 // Height of window
  mov X5, #0
  bl _SDL_CreateWindow
  mov X19, X0 // Move window handle into X19
  cmp X19, #0 // Verify if we have a window handle
  b.eq _exit_with_error

  sub SP, SP, #16
  mov X20, SP
  b _main_loop

_main_loop:
  mov X0, X20
  bl _SDL_PollEvent
  cmp X0, #0
  b.eq _continue_loop

  ldr W1, [X20]
  cmp W1, #SDL_QUIT // Check if the vent was a quit event
  b.eq _exit

_continue_loop:
  b _main_loop

_exit:
  mov X0, X19 // Retrieving the window handle
  bl _SDL_DestroyWindow
  bl _SDL_Quit

  // Exit the program
  mov X0, #0 // Return code
  mov X16, #1 // Exit syscall
  svc #0

_exit_with_error:
  bl _SDL_Quit

  // Exit the program
  mov X0, #1 // Return code
  mov X16, #1 // Exit system call
  svc #0

.extern _SDL_INIT
.extern _SDL_CreateWindow
.extern _SDL_DestroyWindow
.extern _SDL_Quit
.extern _SDL_PollEvent

window_title: .ascii "SDL Window\0"
