
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
		{"add", std::bind(add, first, second)},
		{"multiply", std::bind(multiply, first, second)},
		{"substract", std::bind(substract, first, second)}
		
	};

};

