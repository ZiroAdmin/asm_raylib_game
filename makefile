RL := $(CURDIR)/.raylib

ifeq ($(shell /sbin/ldconfig -p | grep -c libraylib),0)
RLFLAGS := -L$(RL)/lib
RLDEP := $(RL)/lib/libraylib.a
endif

main: *.s $(RLDEP)
	gcc *.s -o build/main -g $(RLFLAGS) -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

$(RL)/lib/libraylib.a:
	git clone --depth 1 https://github.com/raysan5/raylib.git $(RL)/src
	cmake -S $(RL)/src -B $(RL)/build -DCMAKE_INSTALL_PREFIX=$(RL) -DBUILD_EXAMPLES=OFF
	cmake --build $(RL)/build -j4
	cmake --install $(RL)/build