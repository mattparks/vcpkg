include(vcpkg_common_functions)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO EQMG/Acid
	REF 5b0d63e221760084c825a50e4db29479c1d7e54f
	SHA512 7ed9a6c024ffaeb549e60b21e5c45c418c6a1f36c0d550bcf96c99776229356561231ef9c5cf40ebee15a28d7e548d89242d922b2fbdecc2cb6776609ee39cec
	HEAD_REF font2
	PATCHES
		CMakeLists-targets.patch
)

vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA
	OPTIONS
		-DBUILD_TESTS=OFF
		-DACID_INSTALL_EXAMPLES=OFF
		-DACID_INSTALL_RESOURCES=ON
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/Acid)

vcpkg_copy_pdbs()
