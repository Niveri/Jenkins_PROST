// Jenkins_PROST.h: plik dołączany dla standardowych systemowych plików dołączanych,
// lub pliki dołączane specyficzne dla projektu.

#pragma once

#include <iostream>
#include<map>
#include<string>
#include<functional>




auto add = [](const auto first, const auto second) {
	return first + second;
};
auto multiply = [](const auto first, const auto second) {
	return first * second;
};
auto substract = [](const auto first, const auto second) {
	return first - second;
};


auto initializer = [](const auto first, const auto second) ->std::map<std::string, std::function<int()>> {
	return {
		{"add", bind(add, first, second)},
		{"multiply", bind(multiply, first, second)},
		{"substract", bind(substract, first, second)}
		
	};

};

