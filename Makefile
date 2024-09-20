CC = clang
TARGET = build/sdl2_window
COMMON_FLAGS = -target arm64-apple-macos14
LDFLAGS = -L/opt/homebrew/lib -lSDL2 -framework OpenGL

SRC_DIR = src
BUILD_DIR = build

# Assembly source files
SRCS = $(wildcard $(SRC_DIR)/*.s)
OBJS = $(SRCS:$(SRC_DIR)/%.s=$(BUILD_DIR)/%.o)

all: $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s | $(BUILD_DIR)
	$(CC) $(COMMON_FLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(COMMON_FLAGS) $(OBJS) -o $(TARGET) $(LDFLAGS)

clean:
	rm -rf $(BUILD_DIR)

run: $(TARGET)
	@./$(TARGET)

.PHONY: all clean run
