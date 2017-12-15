CXX=pgc++
CXXFLAGS=$(LIBS) -ta=multicore
CC=pgcc
CFLAGS=-O3 $(LIBS) -ta=multicore -Minform=inform -Minfo=all #-Mvect=nosimd
LIBS=-acc -acclibs

prj_perceptron_multicamadas: main.o perceptron_multicamadas.o uniform.o \
		             historico_treinamento.o
	$(CXX) main.o perceptron_multicamadas.o historico_treinamento.o \
	uniform.o $(CXXFLAGS) -o prj_perceptron_multicamadas

main.o: src/main.c
	$(CC) -c src/main.c $(CFLAGS) -o main.o

perceptron_multicamadas.o: src/perceptron_multicamadas.c
	$(CC) -c src/perceptron_multicamadas.c $(CFLAGS) \
	-o perceptron_multicamadas.o

uniform.o: src/uniform.c
	$(CC) -c src/uniform.c $(CFLAGS) \
	-o uniform.o

historico_treinamento.o: src/historico_treinamento.c
	$(CC) -c src/historico_treinamento.c $(CFLAGS) \
	-o historico_treinamento.o

clean:
	rm *.o
