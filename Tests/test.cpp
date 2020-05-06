#define CATCH_CONFIG_MAIN
#include "catch2/catch.hpp"
#include "Jenkins_PROST.h"

TEST_CASE("Adds") {
	auto calculator = initializer(1, 2);
	int result = calculator["add"]();
	CHECK(result == 3);
}