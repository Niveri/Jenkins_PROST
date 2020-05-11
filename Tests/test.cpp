#define CATCH_CONFIG_MAIN
#include "catch2/catch.hpp"
#include "Jenkins_PROST.h"

TEST_CASE("Adds") {
	auto calculator = initializer(1, 2);
	int result = calculator["add"]();
	CHECK(result == 3);
}
TEST_CASE("Substracts") {
	auto calculator = initializer(3, 1);
	int result = calculator["substract"]();
	CHECK(result == 1);
}