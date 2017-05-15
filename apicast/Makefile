$(INST_LUADIR)/apicast:
	mkdir -p $@

install: $(INST_LUADIR)/apicast
	@echo --- install
	@env | grep INST_
	cp -r apicast/src/ $(INST_LUADIR)/
	cp apicast/bin/apicast* $(INST_BINDIR)/
	cp -vr apicast/*.d $(INST_CONFDIR)/
	lemplate --compile apicast/templates > $(INST_LUADIR)/apicast/templates.lua
