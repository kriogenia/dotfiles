DOT_ROOT := ~/.dot

NVIM_CUSTOM := .config/nvim/lua/custom
OHMYZSH_CUSTOM = .oh-my-zsh/custom

dot_nvim:
	rm -rf $(DOT_ROOT)/$(NVIM_CUSTOM)
	mkdir -p $(DOT_ROOT)/$(NVIM_CUSTOM)
	cp -r $(HOME)/$(NVIM_CUSTOM)/* $(DOT_ROOT)/$(NVIM_CUSTOM)
	rm $(DOT_ROOT)/$(NVIM_CUSTOM)/README.md

dot_ohmyzsh:
	rm -rf $(DOT_ROOT)/$(OHMYZSH_CUSTOM)
	mkdir -p $(DOT_ROOT)/$(OHMYZSH_CUSTOM)
	cp -r $(HOME)/$(OHMYZSH_CUSTOM)/*.* $(DOT_ROOT)/$(OHMYZSH_CUSTOM)
	rm $(DOT_ROOT)/$(OHMYZSH_CUSTOM)/example.zsh

dot_copy:
	cd $(HOME)
	make dot_nvim
	make dot_ohmyzsh

.PHONY: dot_copy
