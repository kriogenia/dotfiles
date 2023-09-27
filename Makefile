DOTCONFIG := ~/.dotconfig
CONFIG := ~/.config
NVIM_CUSTOM := nvim/lua/custom

dot_nvim:
	rm -r $(DOTCONFIG)/$(NVIM_CUSTOM)
	mkdir $(DOTCONFIG)/$(NVIM_CUSTOM)
	cp -r $(CONFIG)/$(NVIM_CUSTOM)/* $(DOTCONFIG)/$(NVIM_CUSTOM)
	rm $(DOTCONFIG)/$(NVIM_CUSTOM)/README.md

.PHONY: dot_nvim
