// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "Teapot",
	products: [
		.executable(name: "Teapot", targets: ["Teapot"]),
	],
	dependencies: [],
	targets: [
		.executableTarget(name: "Teapot", dependencies: [])
	]
)
