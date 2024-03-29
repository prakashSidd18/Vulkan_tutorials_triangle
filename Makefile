VULKAN_SDK_PATH = /home/siddprakash/VulkanSDK/1.0.39.0/x86_64
CFLAGS = -std=c++11 -I$(VULKAN_SDK_PATH)/include

LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

VulkanTest: main.cpp
	g++ $(CFLAGS) -pg main.cpp -o VulkanTest $(LDFLAGS)

.PHONY: test clean

test:	VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d	./VulkanTest

debug:	VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d	gdb VulkanTest

clean:
	rm -f VulkanTest


