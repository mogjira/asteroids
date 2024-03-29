CC = gcc
CFLAGS = -Wall 
LIBS = -lvulkan -lxcb -lxcb-keysyms -lm -lportaudio
O = build
GLSL = shaders
SPV  = shaders/spv
TOOL = tools

NAME = as

DEPS =                 \
		d_display.h    \
		v_video.h      \
		v_def.h        \
		v_memory.h     \
		r_render.h     \
		r_commands.h   \
		r_pipeline.h   \
		g_game.h       \
		m_math.h       \
		w_world.h      \
		w_collision.h  \
		w_create.h     \
		i_input.h      \
		a_audio.h      \
		utils.h        \
		def.h

OBJS = 					    \
		$(O)/d_display.o    \
		$(O)/v_video.o      \
		$(O)/v_memory.o     \
		$(O)/r_render.o     \
		$(O)/r_pipeline.o   \
		$(O)/r_commands.o   \
		$(O)/g_game.o       \
		$(O)/m_math.o       \
		$(O)/w_world.o      \
		$(O)/w_collision.o  \
		$(O)/w_create.o     \
		$(O)/i_input.o      \
		$(O)/a_audio.o      \
		$(O)/utils.o

SHADERS =                         \
		$(SPV)/simple-vert.spv    \
		$(SPV)/simple-frag.spv    \
		$(SPV)/postproc-vert.spv  \
		$(SPV)/postproc-frag.spv  \
		$(SPV)/glow-only-frag.spv


debug: CFLAGS += -g -DVERBOSE=1
debug: all

release: CFLAGS += -DNDEBUG -O2
release: all

all: $(O)/$(NAME) tags

shaders: $(SHADERS)

tool: 
	gcc tools/kernel-gen.c -o build/kernel-gen -lm

clean: 
	rm -f $(O)/*

tags:
	ctags -R .

$(O)/$(NAME): main.c $(OBJS) $(DEPS)
	mkdir -p $(O)
	$(CC) $(CFLAGS) $(OBJS) $< -o $@ $(LIBS)

$(O)/%.o:  %.c $(DEPS)
	mkdir -p $(O)
	$(CC) $(CFLAGS) -c $< -o $@

$(SPV)/%-vert.spv: $(GLSL)/%.vert
	glslc $< -o $@

$(SPV)/%-frag.spv: $(GLSL)/%.frag
	glslc $< -o $@
