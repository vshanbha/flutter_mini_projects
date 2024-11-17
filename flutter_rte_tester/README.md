# flutter_rte_tester

A simple project to test rich text editors available in flutter

## Getting Started

To start development download the the source and run the following to run the code in hot reload mode

```
flutter run
```

To publish project to GitHub pages run the following steps

1. Build Project for web with appropriate base-href attribute

```
flutter build web --base-href "/flutter_mini_projects/deployments/web/flutter_rte_tester/"
```

2. Overwrite deployed folder with the built output. Relevant commands for Linux and Mac are below.

```
rm -r ../deployments/web/flutter_rte_tester/
mv build/web ../deployments/web/flutter_rte_tester
```

