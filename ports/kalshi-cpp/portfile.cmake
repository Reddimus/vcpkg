vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Reddimus/kalshi-cpp
    REF "v${VERSION}"
    SHA512 4eff9dcc26228750a728fe5649cb3d337b5436281cfded8f84b161cfb6fa2e74cf26621740fa9e057b8f631a12bf0d194974f191813f135577cb89d1c43cfbf6
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DKALSHI_USE_SYSTEM_GLAZE=ON
        -DKALSHI_BUILD_TESTS=OFF
        -DKALSHI_BUILD_EXAMPLES=OFF
        -DKALSHI_BUILD_BENCHMARKS=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME kalshi CONFIG_PATH lib/cmake/kalshi)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
