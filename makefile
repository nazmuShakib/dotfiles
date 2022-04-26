SHELL := /bin/bash

CXX := g++
DEBUG := false

CXXFLAGS := -Wall -Wextra -pedantic -std=c++2a -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -DLocal

DEBUG_CXXFLAGS := -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector

ifeq ($(DEBUG),true)
CXXFLAGS += $(DEBUG_CXXFLAGS)
endif

.PHONY = all

all: $(patsubst %.cpp, %.out, $(wildcard *.cpp))
.SILENT:

%.out: %.cpp
	@$(CXX) $(CXXFLAGS) -o $@ $<
