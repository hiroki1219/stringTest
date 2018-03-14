TARGET   = ./run
CPPFLAGS = -g -MMD -MP -Wall -Wextra -Winit-self -Wno-missing-field-initializers
LIBS     = 
SRCDIR   = ./source
SOURCES  = $(wildcard $(SRCDIR)/*.cpp)
INCLUDE  = -I ./include
OBJDIR   = ./obj
OBJECTS  = $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.cpp=.o)))
DEPENDS  = $(OBJECTS:.o=.d)

$(TARGET): $(OBJECTS) $(LIBS)
	g++ -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	-mkdir -p $(OBJDIR)
	g++ $(CPPFLAGS) $(INCLUDE) -o $@ -c $<

all: clean $(TARGET)

clean:
	-rm -f $(OBJECTS) $(DEPENDS) $(TARGET)

-include $(DEPENDS)
