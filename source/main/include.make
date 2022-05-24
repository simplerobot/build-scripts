
define BUILD_SCRIPTS_LOAD_DEPENDENCY # (dependency_name, dependency_define_name, load_command)

../$1 :
	$$(error Dependency $1 is not loaded in the workspace with '$3'.)
	
../$1/build/release : ../$1
	$$(error Dependency $1 needs to be built.)
	
PKG_$2_DIR = ../$1/build/release
PKG_ALL_DEPENDENCY_DIRS += $$(PKG_$2_DIR)

endef # BUILD_SCRIPTS_LOAD_DEPENDENCY


define BUILD_SCRIPTS_GITHUB_LOAD_DEPENDENCY # (github_project)
	$(call BUILD_SCRIPTS_LOAD_DEPENDENCY,$(notdir $1),$(shell echo '$(subst -,_,$(notdir $1))' | tr '[:lower:]' '[:upper:]'),git clone git@github.com:$1.git)
endef # BUILD_SCRIPTS_GITHUB_LOAD_DEPENDENCY


$(foreach dep,$(GITHUB_DEPS),$(eval $(call BUILD_SCRIPTS_GITHUB_LOAD_DEPENDENCY,$(dep))))


.PHONY : deps
deps : $(PKG_ALL_DEPENDENCY_DIRS)
