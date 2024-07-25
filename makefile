CXX = g++
SFML_FLAGS = -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio
FLAGS = -Wall -pedantic -IHeaders

all: main
	./main
	rm main

main: Objects/main.o Objects/Game.o Objects/Attribute.o Objects/Hero.o Objects/Base.o Objects/Enemies.o Objects/StatusBar.o
	$(CXX) $^ $(SFML_FLAGS) $(FLAGS) -o main

Objects/main.o: main.cpp Headers/Game.hpp
	$(CXX) $(SFML_FLAGS) $(FLAGS) -c main.cpp -o Objects/main.o

Objects/Game.o: Implementations/Game.cpp Headers/Game.hpp
	$(CXX) $(SFML_FLAGS) $(FLAGS) -c Implementations/Game.cpp -o Objects/Game.o

Objects/Attribute.o: Implementations/Attribute.cpp Headers/Attribute.hpp
	$(CXX) $(SFML_FLAGS) $(FLAGS) -c Implementations/Attribute.cpp -o Objects/Attribute.o

Objects/Hero.o: Implementations/Hero.cpp Headers/Hero.hpp
	$(CXX) $(SFML_FLAGS) $(FLAGS) -c Implementations/Hero.cpp -o Objects/Hero.o

Objects/Base.o: Implementations/Base.cpp Headers/Base.hpp
	$(CXX) $(SFML_FLAGS) $(FLAGS) -c Implementations/Base.cpp -o Objects/Base.o

Objects/Enemies.o: Implementations/Enemies.cpp Headers/Enemies.hpp
	$(CXX) $(SFML_FLAGS) $(FLAGS) -c Implementations/Enemies.cpp -o Objects/Enemies.o

Objects/StatusBar.o: Implementations/StatusBar.cpp Headers/StatusBar.hpp
	$(CXX) $(SFML_FLAGS) $(FLAGS) -c Implementations/StatusBar.cpp -o Objects/StatusBar.o

clean:
	rm -f main Objects/*.o