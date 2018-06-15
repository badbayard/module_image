CC= g++
FLAGS = -g -Wall -c
INCLUDE_DIR_SDL = -I/usr/include/SDL2
LIBS_SDL = -lSDL2 -lSDL2_ttf -lSDL2_image

all : bin/exemple bin/affichage bin/test

bin/exemple : obj/Image.o obj/Pixel.o obj/main.o
	$(CC) $(INCLUDE_DIR_SDL) obj/Image.o obj/Pixel.o obj/main.o -o bin/exemple $(LIBS_SDL)

bin/affichage : obj/Image.o obj/Pixel.o obj/mainAffichage.o
	$(CC) $(INCLUDE_DIR_SDL) obj/Image.o obj/Pixel.o obj/mainAffichage.o -o bin/affichage $(LIBS_SDL)

bin/test : obj/Image.o obj/Pixel.o obj/mainTest.o
	$(CC) $(INCLUDE_DIR_SDL) obj/Image.o obj/Pixel.o obj/mainTest.o -o bin/test $(LIBS_SDL)

obj/main.o : src/Image.h src/Pixel.h src/main.cpp
	$(CC) $(FLAGS) $(INCLUDE_DIR_SDL) src/main.cpp -o obj/main.o $(LIBS_SDL)

obj/mainAffichage.o : src/Image.h src/Pixel.h src/mainAffichage.cpp
	$(CC) $(FLAGS) $(INCLUDE_DIR_SDL) src/mainAffichage.cpp -o obj/mainAffichage.o $(LIBS_SDL)

obj/mainTest.o : src/Image.h src/Pixel.h src/mainTest.cpp
	$(CC) $(FLAGS) $(INCLUDE_DIR_SDL) src/mainTest.cpp -o obj/mainTest.o $(LIBS_SDL)

obj/Image.o : src/Image.h src/Image.cpp
	$(CC) $(FLAGS) $(INCLUDE_DIR_SDL) src/Image.cpp -o obj/Image.o $(LIBS_SDL)

obj/Pixel.o : src/Pixel.h src/Pixel.cpp
	$(CC) $(FLAGS) src/Pixel.cpp -o obj/Pixel.o

clean:
	rm obj/*.o
